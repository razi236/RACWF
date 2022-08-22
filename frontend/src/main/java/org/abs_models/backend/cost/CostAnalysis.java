package org.abs_models.backend.cost;
import java.io.*;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.abs_models.Absc;
import org.abs_models.backend.prettyprint.ABSFormatter;
import org.abs_models.backend.prettyprint.DefaultABSFormatter;
import org.abs_models.backend.prettyprint.PrettyPrinterBackEnd;
import org.abs_models.frontend.ast.Model;
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
        String object = null;
        Set<String> sync_set = new HashSet<String>();
        Set<Set<String>> sync_shema = new HashSet<Set<String>>();
        sync_shema = model.generate_sync_schema();
        String s = model.translate();
        return 0;
    }
    public
}
