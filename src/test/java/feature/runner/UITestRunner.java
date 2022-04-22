package feature.runner;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import static org.junit.Assert.*;
import org.junit.Test;

//Important: do not use the @RunWith(Karate.class) annotation. This is a normal JUnit 4 test class
//@RunWith(Karate.class)
@KarateOptions(tags = {"@UI"},features = {"classpath:ui/tests"})

public class UITestRunner {
	@Test
    public void testParallel() {
		System.setProperty("karate.env", "demo");
        Results results = Runner.parallel(getClass(),2);
        generateReport(results.getReportDir());
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }
	
	public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target/ui"), "demo");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
        //CustomReportBuilder regularRptBuilder = new CustomReportBuilder(jsonPaths, "target/extent-reports/", "ExtentRegular");
		//regularRptBuilder.generateReport();
    }
	
}
