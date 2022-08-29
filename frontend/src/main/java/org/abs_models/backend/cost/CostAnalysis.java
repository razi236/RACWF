package org.abs_models.backend.cost;
import java.io.*;
import java.util.*;

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
            model.generate_sync_schema(null, writer);
            //String s = model.translate();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                writer.close();
            }
        }
        Scanner scanner = new Scanner(new File("/Users/muhammadrizwanali/Desktop/GitHub/abstools/Synch_Schema.txt"));
        //scanner.useDelimiter("/");
        String method_name = null;
        String objs = null;
        //Set<String> sync_set = new HashSet<String>();

        Map<String,Set<Set<String>>> sync_schema_map = new HashMap<String,Set<Set<String>>>();
        while(scanner.hasNextLine()) {
            String line = scanner.nextLine();
            //System.out.println(line);
            Scanner scanner1 = new Scanner(line);
            scanner1.useDelimiter("/");
            method_name = scanner1.next();
            Set<Set<String>> sync_schema = new HashSet<Set<String>>();
            //System.out.println(method_name);
            while(scanner1.hasNext()) {
                objs = scanner1.next();
                //System.out.println(objs);
                Scanner scanner2 = new Scanner(objs);
                scanner2.useDelimiter(",");
                Set<String> sync_set = new HashSet<String>();
                while(scanner2.hasNext()) {
                    //System.out.println(scanner2.next());
                    sync_set.add(scanner2.next());
                }
                //sync_schema.add(sync_set);
                sync_schema = merge_schema(sync_schema,sync_set);
                //sync_set.clear();
                scanner2.close();
            }
            //System.out.println();
            sync_schema_map.put(method_name,sync_schema);
            method_name = null;
            //sync_schema.clear();
            scanner1.close();
        }
        scanner.close();


        Iterator<String> method_name_itr = sync_schema_map.keySet().iterator();
        while (method_name_itr.hasNext()) {
            System.out.println(method_name_itr.next());
        }
        System.out.println();
        Iterator<Set<Set<String>>> itr = sync_schema_map.values().iterator();
        while (itr.hasNext()) {
            Iterator<Set<String>> sync_set_itr = itr.next().iterator();
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



        /*
        Set<String> set1 = new HashSet<String>();
        set1.add("a");
        set1.add("b");
        Set<String> set2 = new HashSet<String>();
        set2.add("c");
        set2.add("d");
        Set<Set<String>> set3 = new HashSet<Set<String>>();
        set3.add(set1);
        set3.add(set2);
        Map<String,Set<Set<String>>> map = new HashMap<String,Set<Set<String>>>();
        map.put("main",set3);
        map.put("razi",set3);
        map.put("ali",set3);

        Iterator<Set<Set<String>>> itr = map.values().iterator();
        while (itr.hasNext()) {
            Iterator<Set<String>> sync_set_itr = itr.next().iterator();
            while (sync_set_itr.hasNext()) {
                Iterator<String> objs_itr = sync_set_itr.next().iterator();
                while (objs_itr.hasNext()) {
                    System.out.println(objs_itr.next());
                }
            }
        }
        */




        return 0;
    }

    public Set<Set<String>> merge_schema(Set<Set<String>> sync_schema, Set<String> sync_set){
        Iterator<Set<String>> i = sync_schema.iterator();
        boolean flag = true;
        while(i.hasNext())
        {
            Set<String> temp = new HashSet<String>(i.next());
            Set<String> intersection = new HashSet<String>(temp);
            intersection.retainAll(sync_set);
            if(!intersection.isEmpty())
            {
                flag = false;
                Set<String> temp1 = new HashSet<String>(temp);
                sync_schema.remove(temp);
                temp1.addAll(sync_set);
                sync_schema.add(temp1);
                //break;
            }
        }
        if(flag == true)
        {
            sync_schema.add(sync_set);
        }
        return sync_schema;
    }
}
