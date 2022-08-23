package org.abs_models.backend.cost;
import java.io.*;
import java.util.*;

import org.abs_models.Absc;
import org.abs_models.backend.prettyprint.ABSFormatter;
import org.abs_models.backend.prettyprint.DefaultABSFormatter;
import org.abs_models.backend.prettyprint.PrettyPrinterBackEnd;
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
        this.arguments = args;
        final Model model = parse(arguments.files);
        PureExp object = null;
        Set<PureExp> sync_set = new HashSet<PureExp>();
        Set<Set<PureExp>> sync_schema = new HashSet<Set<PureExp>>();
        Map<String,Set<Set<PureExp>>> sync_schema_map = new HashMap<String,Set<Set<PureExp>>>(); // [method_name -> sync_schema]
        sync_schema_map = model.generate_sync_schema(sync_schema_map,"main", null);
        //String s = model.translate();
        return 0;
    }
}
