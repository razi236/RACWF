/**
 * Copyright (c) 2009-2011, The HATS Consortium. All rights reserved.
 * This file is licensed under the terms of the Modified BSD License.
 */
package org.abs_models.backend.prettyprint;

import java.io.*;

import org.abs_models.Absc;
import org.abs_models.frontend.ast.Model;
import org.abs_models.frontend.parser.Main;

public class PrettyPrinterBackEnd extends Main {

    public static int doMain(Absc args) {
        PrettyPrinterBackEnd backend = new PrettyPrinterBackEnd();
        backend.arguments = args;
        int result = 0;
        try {
            result = backend.compile(args);
        } catch (Exception e) {
            System.err.println("An error occurred during compilation:\n" + e.getMessage());
            if (backend.arguments.debug) {
                e.printStackTrace();
            }
            result = 1;
        }
        return result;
    }

    public int compile(Absc args) throws Exception {
        this.arguments = args;
        final Model model = parse(arguments.files);
        if (arguments.prettyprint_keepsugar) {
            model.doAACrewrite = false;
            model.doForEachRewrite = false;
        }
        if (arguments.prettyprint_keepstdlib) {
            model.doPrettyPrintStdLib = true;
        }
        if (!arguments.prettyprint_force && (model.hasParserErrors() || model.hasErrors() || model.hasTypeErrors())) {
            printErrorMessage();
            return 1;
        }

        // Set the line separator to LF so the file output prints UNIX line endings on println() calls.
        System.setProperty("line.separator", "\n");
        final PrintStream stream;
        final String loc;
        if (arguments.outputfile != null) {
            stream = new PrintStream(new FileOutputStream(arguments.outputfile), false, "utf-8");
            loc = arguments.outputfile.getAbsolutePath();
        } else {
            stream = System.out;
            loc = "Standard Output Stream";
        }

        if (arguments.verbose) {
            System.out.println("Output ABS model source code to " + loc + "...");
        }

        /*PrintWriter writer = new PrintWriter(new OutputStreamWriter(stream), true);
        // Set line separator back to default value
        System.setProperty("line.separator", System.lineSeparator());
        ABSFormatter formatter = new DefaultABSFormatter(writer);
        model.doPrettyPrint(writer, formatter);*/

        File file = new File("/Users/muhammadrizwanali/Desktop/GitHub/abstools/RABS.abs");
        FileInputStream inputStream = new FileInputStream("/Users/muhammadrizwanali/Desktop/GitHub/abstools/ResourceManagerAPI.abs");
        FileOutputStream outputStream = new FileOutputStream(file);
        PrintWriter writer = null;
        try {
            // declare variable for indexing
            int i;
            // use while loop with read() method of FileInputStream class to read bytes data from file1
            while ((i = inputStream.read()) != -1) {

                // use write() method of FileOutputStream class to write the byte data into file2
                outputStream.write(i);
            }
        }
        // catch block to handle exceptions
        catch (Exception e) {
            System.out.println("Error Found: " + e.getMessage());
        }
        // use finally to close instance of the FileInputStream and FileOutputStream classes
        finally {
            if (inputStream != null) {
                // use close() method of FileInputStream class to close the stream
                inputStream.close();
            }
            if (outputStream != null) {
                outputStream.close();
            }
        }
        BufferedWriter br = null;
        FileWriter fr = null;
        try {
            fr = new FileWriter(file, true);
            br = new BufferedWriter(fr);
            writer = new PrintWriter(br);
            System.setProperty("line.separator", System.lineSeparator());
            ABSFormatter formatter = new DefaultABSFormatter(writer);
            model.doPrettyPrint(writer, formatter);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                writer.close();
            }
            if (br != null) {
                br.close();
            }
            if (fr != null) {
                fr.close();
            }
        }
        return 0;
    }
}
