package eu.hatsproject.absplugin.editor.reconciling;

import static eu.hatsproject.absplugin.util.Constants.DEFAULT_LOCATION_TYPE;
import static eu.hatsproject.absplugin.util.Constants.LOCATION_TYPECHECK;
import static eu.hatsproject.absplugin.util.Constants.LOCATION_TYPE_PRECISION;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.core.resources.IResource;
import org.eclipse.core.runtime.CoreException;
import org.eclipse.jface.preference.IPersistentPreferenceStore;

import abs.frontend.analyser.SemanticErrorList;
import abs.frontend.ast.ASTNode;
import abs.frontend.ast.CompilationUnit;
import abs.frontend.ast.Model;
import abs.frontend.typechecker.locationtypes.LocationType;
import abs.frontend.typechecker.locationtypes.infer.LocationTypeInferrerExtension;
import abs.frontend.typechecker.locationtypes.infer.LocationTypeInferrerExtension.LocationTypingPrecision;
import eu.hatsproject.absplugin.builder.AbsNature;
import eu.hatsproject.absplugin.util.Constants;
import eu.hatsproject.absplugin.util.CoreControlUnit;
import eu.hatsproject.absplugin.util.CoreControlUnit.ResourceBuildListener;
import eu.hatsproject.absplugin.util.CoreControlUnit.ResourceBuiltEvent;

public class AbsModelManagerImpl implements AbsModelManager, ResourceBuildListener {


    private AbsNature absNature;

    private Model model;
    private List<ModelChangeListener> changeListeners = new ArrayList<ModelChangeListener>();

    public AbsModelManagerImpl(AbsNature absNature) {
        this.absNature = absNature;
        CoreControlUnit.addResourceBuildListener(this);
        updateModelFromNature();
    }



    @Override
    public synchronized void updateModel(CompilationUnit cu, boolean withTypechecks) {
        boolean added = false;
        for (int i=0; i<model.getNumCompilationUnit(); i++) {
            CompilationUnit c = model.getCompilationUnit(i);
            if (c.getFileName().equals(cu.getFileName())) {
                // update compilation unit:
                model.setCompilationUnit(cu, i);
                added = true;
                break;
            }
            
        }
        if (!added) {
            model.addCompilationUnit(cu);
        }


        if (!model.hasParserErrors()) {
            if (withTypechecks) {
                extendedTypechecking();
            }
        }

        notifyChangeListeners();
    }



    private void notifyChangeListeners() {
        for (ModelChangeListener cl : changeListeners) {
            cl.onModelChange(model);
        }
    }

    private void extendedTypechecking() {
        if (absNature.getProject() != null) {
            IPersistentPreferenceStore projectPreferences = absNature.getProjectPreferenceStore();
            flushAll(model);
            model.getTypeExt().clearTypeSystemExtensions();
            boolean dolocationtypecheck = projectPreferences.getBoolean(LOCATION_TYPECHECK);
            if (dolocationtypecheck) {

                String defaultlocationtypeprecision = projectPreferences.getString(LOCATION_TYPE_PRECISION);
                LocationType defaultLocType = LocationType.createFromName(projectPreferences.getString(DEFAULT_LOCATION_TYPE));
                LocationTypeInferrerExtension ltie = new LocationTypeInferrerExtension(model);
                ltie.setDefaultType(defaultLocType);
                ltie.setLocationTypingPrecision(LocationTypingPrecision.valueOf(defaultlocationtypeprecision));
                model.registerTypeSystemExtension(ltie);
            }
        }
        SemanticErrorList typeErrors = model.typeCheck();

        updateMarkers(typeErrors);

    }

    private void updateMarkers(SemanticErrorList typeErrors) {
        // update markers
        try {
            if (absNature.getProject() == null) { 
                return;
            }
            absNature.getProject().deleteMarkers(Constants.TYPECHECK_MARKER_TYPE, true, IResource.DEPTH_INFINITE);
            absNature.createMarkers(typeErrors);
        } catch (CoreException e) {
            e.printStackTrace();
        }
    }

    @SuppressWarnings("rawtypes")
    private static void flushAll(ASTNode node){
        for(int i=0; i<node.getNumChild(); i++){
            flushAll(node.getChild(i));
        }
        node.flushCache();
    }

    @Override
    public synchronized Model getModel() {
        return model;
    }

    @Override
    public synchronized CompilationUnit getCompilationUnit(String absoluteFilePath) {
        if (model == null) return null;
        for (CompilationUnit cu : model.getCompilationUnits()) {
            if (cu.getFileName().equals(absoluteFilePath)) {
                return cu;
            }
        }
        return null;
    }



    @Override
    public synchronized void resourceBuilt(ResourceBuiltEvent builtevent) {
        updateModelFromNature();
    }



    private void updateModelFromNature() {
        Model build = absNature.getCompleteModel();
        if (build != null && model != build) {
            model = build.parseTreeCopy();
            notifyChangeListeners();
        }
    }

}