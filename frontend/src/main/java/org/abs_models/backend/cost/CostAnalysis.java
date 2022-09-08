package org.abs_models.backend.cost;
import java.io.*;
import java.util.*;
import org.javatuples.Quartet;

import org.abs_models.Absc;
import org.abs_models.backend.prettyprint.ABSFormatter;
import org.abs_models.backend.prettyprint.DefaultABSFormatter;
import org.abs_models.backend.prettyprint.PrettyPrinterBackEnd;
import org.abs_models.backend.tests.TestRunnerScriptBuilder;
import org.abs_models.frontend.ast.Model;
import org.abs_models.frontend.ast.*;
import org.abs_models.frontend.parser.Main;

public class CostAnalysis extends Main{
    public static int doMain(Absc args) {
        CostAnalysis backend = new CostAnalysis();
        backend.arguments = args;
        int result = 0;
        try {
            result = backend.compute(args);
        } catch (Exception e) {
            System.err.println("An error occurred during cost computation:\n" + e.getMessage());
            if (backend.arguments.debug) {
                e.printStackTrace();
            }
            result = 1;
        }
        return result;
    }
    public int compute(Absc args) throws Exception {
        PrintWriter writer = null;
        try {
            File file = new File("/Users/muhammadrizwanali/Desktop/GitHub/abstools/Synch_Schema.txt");
            writer = new PrintWriter(file);
            System.setProperty("line.separator", System.lineSeparator());
            System.out.println("Computation of Cost is started:");
            this.arguments = args;
            final Model model = parse(arguments.files);
            System.out.println("Parsedd:");
            model.generate_sync_schema(null, writer);
            System.out.println("Generated Sync Schema:");
            Set<Set<String>> sync_schema = new HashSet<Set<String>>();

            Map<String, Set<Set<String>>> sync_schema_map = new HashMap<String, Set<Set<String>>>();
            sync_schema_map = scan_merge_schema();
            System.out.println("Merged Schema:");
            Map<String,Set<String>> I = new HashMap<String,Set<String>>();
            Map<Set<String>,String> Psi = new HashMap<Set<String>,String>();
            String o = null;
            String ta = null;
            String t = null;
            Quartet<Map<String,Set<String>>, Map<Set<String>,String>, String, String> quartet =
                new Quartet<Map<String,Set<String>>, Map<Set<String>,String>, String, String>(I, Psi, ta, t);
            Map<String,Quartet<Map<String,Set<String>>, Map<Set<String>,String>, String, String>> trans_result =
                new HashMap<String,Quartet<Map<String,Set<String>>, Map<Set<String>,String>, String, String>>();
            trans_result = model.translate(trans_result,sync_schema_map,sync_schema,null);

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                writer.close();
            }
        }
        return 0;
    }
    public Map<String, Set<Set<String>>> scan_merge_schema() throws FileNotFoundException {
        Scanner scanner = new Scanner(new File("/Users/muhammadrizwanali/Desktop/GitHub/abstools/Synch_Schema.txt"));
        String method_name = null;
        String objs = null;
        Map<String, Set<Set<String>>> sync_schema_map = new HashMap<String, Set<Set<String>>>();
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            //System.out.println(line);
            Scanner scanner1 = new Scanner(line);
            scanner1.useDelimiter("/");
            method_name = scanner1.next();
            Set<Set<String>> sync_schema = new HashSet<Set<String>>();
            //System.out.println(method_name);
            while (scanner1.hasNext()) {
                objs = scanner1.next();
                //System.out.println(objs);
                Scanner scanner2 = new Scanner(objs);
                scanner2.useDelimiter(",");
                Set<String> sync_set = new HashSet<String>();
                while (scanner2.hasNext()) {
                    //System.out.println(scanner2.next());
                    sync_set.add(scanner2.next());
                }
                /*Iterator<String> set_itr = sync_set.iterator();
                System.out.print("{");
                if(set_itr.hasNext())
                    System.out.print(set_itr.next());
                while (set_itr.hasNext()) {
                    System.out.print(",");
                    System.out.print(set_itr.next());
                }
                System.out.print("}");
                System.out.println();

                 */
                sync_schema = merge_schema(sync_schema, sync_set);
                scanner2.close();
            }
            sync_schema_map.put(method_name, sync_schema);
            method_name = null;
            scanner1.close();
        }
        scanner.close();
        print_schema(sync_schema_map);
        return sync_schema_map;
    }
    public Set<Set<String>> merge_schema(Set<Set<String>> sync_schema, Set<String> sync_set){
        Set<Set<String>> temp_schema = new HashSet<Set<String>>(sync_schema);
        Set<String> union = new HashSet<String>(sync_set);
        boolean flag = true;
        if (!sync_schema.isEmpty()){
            Iterator<Set<String>> i = sync_schema.iterator();
            while (i.hasNext()) {
                Set<String> temp = new HashSet<String>(i.next());
                Set<String> intersection = new HashSet<String>(temp);
                intersection.retainAll(union);
                System.out.println();
                if (!intersection.isEmpty()) {
                    System.out.println("intersaction is not empty");
                    flag = false;
                    temp_schema.remove(new HashSet<String>(temp));
                    union.addAll(temp);
                }
            }
            temp_schema.add(union);
        }
        if(flag == true)
        {
            System.out.println("intersaction is empty");
            temp_schema.add(sync_set);
        }
        return temp_schema;
    }
    public void print_schema(Map<String,Set<Set<String>>> map) {
        Iterator<String> method_name_itr = map.keySet().iterator();
        while (method_name_itr.hasNext()) {
            String name = method_name_itr.next();
            System.out.print(name+": ");
            Set<Set<String>> val = map.get(name);
            Iterator<Set<String>> sync_set_itr = val.iterator();
            while (sync_set_itr.hasNext()) {
                Iterator<String> objs_itr = sync_set_itr.next().iterator();
                System.out.print("{");
                if(objs_itr.hasNext())
                    System.out.print(objs_itr.next());
                while (objs_itr.hasNext()) {
                    System.out.print(",");
                    System.out.print(objs_itr.next());
                }
                System.out.print("}");
            }
            System.out.println();
        }
    }
}
