package cn.edu.gdin.Aaction;

import java.awt.Color;
import java.awt.Font;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.general.DefaultPieDataset;

import cn.edu.gdin.Aservice.AdminCommonService;
import cn.edu.gdin.entity.SelectCourse;
import cn.edu.gdin.util.Struts2Utils;

import com.opensymphony.xwork2.ActionSupport;

public class ChartBAction extends ActionSupport{

	private AdminCommonService adminCommonService;
	public void setAdminCommonService(AdminCommonService adminCommonService) {
		this.adminCommonService = adminCommonService;
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		DefaultPieDataset dataType = new DefaultPieDataset();
		// 数据参数 内容，数量
		List<SelectCourse> se = this.adminCommonService.findAll(SelectCourse.class);
		
		if(!se.isEmpty()){
			dataType.setValue("无成绩", this.adminCommonService.getResultTJ(SelectCourse.class, "result", 0, 0).size());
			dataType.setValue("不及格", this.adminCommonService.getResultTJ(SelectCourse.class, "result", 1, 59).size());
			dataType.setValue("中等", this.adminCommonService.getResultTJ(SelectCourse.class, "result", 60, 79).size());
			dataType.setValue("良好", this.adminCommonService.getResultTJ(SelectCourse.class, "result", 80, 89).size());
			dataType.setValue("优秀", this.adminCommonService.getResultTJ(SelectCourse.class, "result", 90, 100).size());
		}
	
		
		
		try {
			DefaultPieDataset data = dataType;
			// 生成普通饼状图除掉 3D 即可
			// 生产3D饼状图
			PiePlot3D plot = new PiePlot3D(data);
			JFreeChart chart = new JFreeChart(
					"成绩统计图",            // 图形标题
					JFreeChart.DEFAULT_TITLE_FONT, // 标题字体
					plot,                          // 图标标题对象
					true                           // 是否显示图例
			);
			 //设置百分比  
	          PiePlot pieplot = (PiePlot) chart.getPlot();  
	          DecimalFormat df = new DecimalFormat("0.00%");//获得一个DecimalFormat对象，主要是设置小数问题  
	          NumberFormat nf = NumberFormat.getNumberInstance();//获得一个NumberFormat对象  
	          StandardPieSectionLabelGenerator sp1 = new StandardPieSectionLabelGenerator("{0}  {2}", nf, df);//获得StandardPieSectionLabelGenerator对象  
	          pieplot.setLabelGenerator(sp1);//设置饼图显示百分比  
	          
	          //没有数据的时候显示的内容  
	          pieplot.setNoDataMessage("无数据显示");  
	          pieplot.setCircular(false);  
	          pieplot.setLabelGap(0.02D);  
	        
	          pieplot.setIgnoreNullValues(true);//设置不显示空值  
	          pieplot.setIgnoreZeroValues(true);//设置不显示负值 
	          
			// 设置整个图片的背景色
			chart.setBackgroundPaint(Color.PINK);
			// 设置图片有边框
			chart.setBorderVisible(true);
			// 配置字体
			Font kfont = new Font("宋体", Font.PLAIN, 12);    // 底部
			Font titleFont = new Font("宋体", Font.BOLD, 25); // 图片标题
			// 图片标题
			chart.setTitle(new TextTitle(chart.getTitle().getText(), titleFont));
			// 底部
			chart.getLegend().setItemFont(kfont);
			HttpServletResponse response=ServletActionContext.getResponse();
			response.setContentType("image/");
			ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 1.0f,
					chart, 500, 300, null);
			response.getOutputStream().close();
			/*-------将图片保存起来--------*/
			FileOutputStream fos = null;  
			String imagePath = "C://Users//Administrator//Desktop//chart4.jpg";
			StringBuffer str = Struts2Utils.getHttpServletRequest().getRequestURL();
			System.out.println("str:"+str);
			ChartRenderingInfo info = new ChartRenderingInfo(); 
			try {
				fos = new FileOutputStream(imagePath);
				//将统计图标输出成JPG文件 
				ChartUtilities.writeChartAsJPEG( 
					fos, //输出到哪个输出流 
					1, //JPEG图片的质量，0~1之间 
					chart, //统计图标对象 
					800, //宽 
					600,//高
					info //ChartRenderingInfo 信息 
				);
				fos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
