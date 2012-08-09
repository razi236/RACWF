package apet.absunit;

import static abs.backend.tests.AbsASTBuilderUtil.findMethodImpl;
import static abs.backend.tests.AbsASTBuilderUtil.findMethodSig;
import static abs.backend.tests.AbsASTBuilderUtil.generateImportAST;
import static abs.backend.tests.AbsASTBuilderUtil.getDecl;
import static apet.absunit.ABSUnitTestCaseTranslatorConstants.CONFIGURATION_NAME;
import static apet.absunit.ABSUnitTestCaseTranslatorConstants.FEATURE_NAME;
import static apet.absunit.ABSUnitTestCaseTranslatorConstants.MAIN;
import static apet.absunit.ABSUnitTestCaseTranslatorConstants.PRODUCT_NAME;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import abs.backend.prettyprint.DefaultABSFormatter;
import abs.backend.tests.AbsASTBuilderUtil;
import abs.backend.tests.AbsASTBuilderUtil.DeclNamePredicate;
import abs.backend.tests.AbsASTBuilderUtil.MethodNamePredicate;
import abs.backend.tests.AbsASTBuilderUtil.MethodSigNamePredicate;
import abs.common.StringUtils;
import abs.frontend.analyser.SemanticError;
import abs.frontend.analyser.SemanticErrorList;
import abs.frontend.ast.Access;
import abs.frontend.ast.ClassDecl;
import abs.frontend.ast.DeltaAccess;
import abs.frontend.ast.DeltaClause;
import abs.frontend.ast.DeltaDecl;
import abs.frontend.ast.Deltaspec;
import abs.frontend.ast.Feature;
import abs.frontend.ast.FunctionDecl;
import abs.frontend.ast.InterfaceDecl;
import abs.frontend.ast.InterfaceTypeUse;
import abs.frontend.ast.MethodImpl;
import abs.frontend.ast.MethodSig;
import abs.frontend.ast.Model;
import abs.frontend.ast.ModuleDecl;
import abs.frontend.ast.Product;
import abs.frontend.ast.ProductLine;
import abs.frontend.ast.StarExport;
import abs.frontend.ast.StarImport;
import abs.frontend.tests.ABSFormatter;
import apet.console.ConsoleHandler;
import apet.testCases.ApetTestSuite;
import apet.testCases.TestCase;

/**
 * 
 * @author pwong
 *
 */
public class ABSUnitTestCaseTranslator {
	
	private final Model model;
	private final ModuleDecl module;
	private final Set<DeltaDecl> deltas;
	private ProductLine productline;
	private Product product;
	
	private File outputFile;
	
	private final boolean verbose;
	
	private final TestCaseNamesBuilder testCaseNameBuilder = new TestCaseNamesBuilder();
	private final ABSUnitTestCaseTranslatorHelper translatorHelper =  new ABSUnitTestCaseTranslatorHelper();
	private final PureExpressionBuilder pureExpBuilder;
	private final DeltaForGetSetFieldsBuilder deltaBuilder;
	private final MethodTestCaseBuilder methodBuilder;
	private final FunctionTestCaseBuilder functionBuilder;
	
	public ABSUnitTestCaseTranslator(Model model, File outputFile, boolean verbose) {
		if (model == null)
			throw new IllegalArgumentException("Model cannot be null!");

		this.model = model;
		this.module = new ModuleDecl();
		this.module.setName(MAIN);
		this.deltas = new HashSet<DeltaDecl>();
		this.pureExpBuilder = new PureExpressionBuilder(this.model, module);
		this.deltaBuilder = new DeltaForGetSetFieldsBuilder(deltas);
		this.methodBuilder = new MethodTestCaseBuilder(pureExpBuilder, deltaBuilder, this.model);
		this.functionBuilder = new FunctionTestCaseBuilder(pureExpBuilder, deltaBuilder, this.model);
		this.verbose = verbose;
		
		console("Gathering ABSUnit annotations");
		
		/*
		 * Do not search for test class definitions if this model does not
		 * contain the necessary ABSUnit annotations
		 */
		if (! translatorHelper.gatherABSUnitAnnotations(this.model)) {
			return;
		}
		
		this.outputFile = outputFile;
		this.translatorHelper.setABSAssertImpl(model);
	}
	
	public boolean hasABSUnit() {
		return translatorHelper.hasABSUnit();
	}
	
	/**
	 * Generates an ABS module {@link ModuleDecl} that defines the 
	 * given test suite.
	 * 
	 * @param suite
	 * @return
	 */
	public ModuleDecl generateABSUnitTests(ApetTestSuite suite) {
		console("Add basic imports...");
		addBasicImports(module);
		
		for (String key : suite.keySet()) {
			console("Generating test suite for "+key+"...");
			generateABSUnitTest(suite.get(key), key);
		}
		
		buildProductLine(module);
		console("Pretty printing ABSUnit tests...");
		printToFile(module, outputFile);
		console("Validating ABSUnit tests...");
		validateOutput();
		console("ABSUnit tests generation successful");
		return module;
	}
	
	void buildProductLine(ModuleDecl module) {
		String moduleName = module.getName();
		
		Set<String> dn = new HashSet<String>();
		for (DeltaDecl d : deltas) {
			abs.frontend.ast.List<DeltaAccess> access = new abs.frontend.ast.List<DeltaAccess>();
			access.add(new DeltaAccess(moduleName));
			d.setDeltaAccessList(access);
			dn.add(d.getName());
		}
		
		if (! dn.isEmpty()) {
			console("Generating product line description...");
			productline = new ProductLine();
			productline.setName(CONFIGURATION_NAME);
			Feature feature = new Feature();
			feature.setName(FEATURE_NAME);
			productline.addOptionalFeature(feature);
			
			for (String d : dn) {
				DeltaClause clause = new DeltaClause();
				Deltaspec spec = new Deltaspec();
				spec.setName(d);
				clause.setDeltaspec(spec);
				clause.addFeature(feature);
				productline.addDeltaClause(clause);
			}
			
			product = new Product();
			product.setName(PRODUCT_NAME);
			product.addFeature(feature);
			
		}
	}
	
	void generateABSUnitTest(List<TestCase> cs, String mn) {
		
		String[] sp = mn.split("\\.");
		final String methodName; 
		final String className;
		if (sp.length == 2) {
			className = sp[0];
			methodName = sp[1];
		} else if (sp.length == 1) {
			className = null;
			methodName = mn;
		} else {
			throw new IllegalArgumentException();
		}
	
		InterfaceDecl ti = createTestFixture(cs.size(), className, methodName);
		
		if (className == null) {
			createTestSuiteForFunction(cs, ti, methodName);
		} else {
			createTestSuiteForClassMethod(cs, ti, className, methodName);
		}
	}

	void console(String txt) {
		console(txt, false);
	}

	void console(String txt, boolean force) {
		if (verbose || force) {
			ConsoleHandler.write(txt);
		}
	}

	private void validateOutput() {
		Model copy = model.fullCopy();
		copy.getCompilationUnit().addModuleDecl(module.fullCopy());
		
		validateOutput(copy.fullCopy(), null);
		validateOutput(copy.fullCopy(), module.getName().concat(".").concat(PRODUCT_NAME));
	}
	
	private void validateOutput(Model model, String product) {
		Model copy = model.fullCopy();
		if (product != null) {
            try {
				copy.flattenForProduct(product);
			} catch (Exception e) {
				throw new IllegalStateException("Cannot select product "+product, e);
			}
		}
		
        SemanticErrorList typeerrors = copy.typeCheck();
        for (SemanticError se : typeerrors) {
            System.err.println(se.getHelpMessage());
        }
	}
	
	private void addBasicImports(ModuleDecl module) {
		//export *;
		//import * from AbsUnit;
		//import * from AbsUnit.Hamcrest;
		//import * from AbsUnit.Hamcrest.Core;
		module.addExport(new StarExport());
		module.addImport(new StarImport("AbsUnit"));
		module.addImport(new StarImport("AbsUnit.Hamcrest"));
		module.addImport(new StarImport("AbsUnit.Hamcrest.Core"));
	}
	
	private void printToFile(ModuleDecl module, File file) {
        try {
			PrintStream stream = new PrintStream(file);
	        ABSFormatter formatter = new DefaultABSFormatter();
	        PrintWriter writer = new PrintWriter(stream, true);
	        formatter.setPrintWriter(writer);
	        module.doPrettyPrint(writer, formatter);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Create a test suite for testing a function.
	 * 
	 * @param testCases
	 * @param testInterface
	 * @param className
	 * @param functionName
	 */
	private void createTestSuiteForFunction(
			List<TestCase> testCases,
			InterfaceDecl testInterface, 
			String functionName) {
	
		//create test class ([Suite])
		final ClassDecl testClass = translatorHelper.createTestClass(testInterface);

		//find function under test
		FunctionDecl functionUnderTest = getDecl(model, FunctionDecl.class,
				new DeclNamePredicate<FunctionDecl>(functionName));

		final Access access = functionUnderTest.getTypeUse();

		module.addImport(generateImportAST(functionUnderTest));
			
		/*
		 * Test methods and Test cases are ordered that is,
		 * test case 1 is implemented by test method 1 and so on...
		 */
		for (int i=0; i<testCases.size(); i++) {
			console("Generating test case "+i+"...");
			TestCase testCase = testCases.get(i);
			MethodImpl method = testClass.getMethod(i);
			functionBuilder.buildTestCase(testCase, testClass, 
					method, access, functionName);
		}
		
		module.addDecl(testClass);
	}
	
	/**
	 * Create a test suite for testing a method.
	 * 
	 * @param testCases
	 * @param testInterface
	 * @param className
	 * @param methodName
	 */
	private void createTestSuiteForClassMethod(
			List<TestCase> testCases,
			InterfaceDecl testInterface, 
			String className,
			String methodName) {
	
		//create test class ([Suite])
		final ClassDecl testClass = translatorHelper.createTestClass(testInterface);

		//find class under test.
		ClassDecl classUnderTest = getDecl(model, ClassDecl.class, 
				new DeclNamePredicate<ClassDecl>(className));

		assert classUnderTest != null : 
			"It should not be possible to not " +
			"find class under test";

		//find method under test.
		MethodImpl methodUnderTest = 
				findMethodImpl(classUnderTest, new MethodNamePredicate(methodName));

		assert methodUnderTest != null : 
			"It should not be possible to not " +
			"find method under test";

		//find interface of class under test.
		InterfaceDecl interfaceOfClassUnderTest = null;
		for (InterfaceTypeUse iu : classUnderTest.getImplementedInterfaceUseList()) {
			InterfaceDecl infTemp = getDecl(model, InterfaceDecl.class, 
					new DeclNamePredicate<InterfaceDecl>(iu.getName()));

			if (findMethodSig(infTemp, new MethodSigNamePredicate(methodName)) != null) {
				interfaceOfClassUnderTest = infTemp;
				break;
			}
		}

		//return type
		MethodSig signature = methodUnderTest.getMethodSig();
		final Access access = signature.getReturnType();

		//add imports of class/interface under test
		module.addImport(generateImportAST(classUnderTest));
		module.addImport(generateImportAST(interfaceOfClassUnderTest));


		/*
		 * Test methods and Test cases are ordered that is,
		 * test case 1 is implemented by test method 1 and so on...
		 */
		for (int i=0; i<testCases.size(); i++) {			
			console("Generating test case "+i+"...");
			TestCase testCase = testCases.get(i);
			MethodImpl method = testClass.getMethod(i);
			methodBuilder.buildTestCase(testCase, testClass, 
					method, access, methodName);
		}
		
		module.addDecl(testClass);
	}
	
	/**
	 * Create Test Fixture for a given Class method or a function.
	 * 
	 * @param testCaseSize
	 * @param className
	 * @param methodName
	 * @return
	 */
	private InterfaceDecl createTestFixture(int testCaseSize, String className, 
			String methodName) {
		
		String capMethodName = StringUtils.capitalize(methodName);

		if (className == null) {
			className = testCaseNameBuilder.functionClassName(capMethodName);
		}
		
		final String testInterfaceName = testCaseNameBuilder.testInterfaceName(className, capMethodName);
		
		//create fixture
		InterfaceDecl testInterface = getDecl(module, InterfaceDecl.class, 
				AbsASTBuilderUtil.<InterfaceDecl>namePred(testInterfaceName));
		
		if (testInterface == null) {
			testInterface = translatorHelper.createTestInterface(testInterfaceName);
			module.addDecl(testInterface);
		}
		
		for (int i=1; i<=testCaseSize; i++) {
			testInterface.addBody(
					translatorHelper.createTestMethodSig(testCaseNameBuilder.testMethodName(capMethodName, 
					Integer.valueOf(i).toString())));
		}
		
		return testInterface;
	}
	
}
