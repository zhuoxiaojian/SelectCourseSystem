package cn.edu.gdin.Aaction;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.TextAnchor;

import cn.edu.gdin.Aservice.AdminCommonService;
import cn.edu.gdin.entity.SelectCourse;
import cn.edu.gdin.entity.Student;

import com.opensymphony.xwork2.ActionSupport;

public class ChartLAction extends ActionSupport{
	private AdminCommonService adminCommonService;
	public void setAdminCommonService(AdminCommonService adminCommonService) {
		this.adminCommonService = adminCommonService;
	}

	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		DefaultCategoryDataset chartDate = new DefaultCategoryDataset(); 
		List<Student> list = this.adminCommonService.findAll(Student.class);
		if(!list.isEmpty()){
			for(Student s : list){
				if(!this.adminCommonService.getByParamData(SelectCourse.class, "id.student.stunum", s.getStunum()).isEmpty()){
					 chartDate.addValue(this.adminCommonService.getGDTwoParam(SelectCourse.class, "id.student.stunum", s.getStunum()).size(), "选了那么多课啊", s.getStuname());
				}
			}
		}
		JFreeChart loanRemainChart=ChartFactory.createLineChart(  
                "每人选课统计情况",   
                "学生姓名",  
                "总选课数",  
                chartDate,  
                PlotOrientation.VERTICAL,  
                false,  
                false,  
                false);  
		 loanRemainChart.setBorderVisible(true);  
         Font xfont=new Font("宋体",Font.PLAIN,12);    
         Font yfont=new Font("宋体",Font.PLAIN,12);  
         Font font= new Font("宋体",Font.PLAIN,12);  //底部  
         Font titleFont = new Font("宋体",Font.BOLD,25);  //图片标题  
         loanRemainChart.getTitle().setFont(titleFont); // 设置标题字体    
         loanRemainChart.setBackgroundPaint(Color.WHITE);// 设置背景色     
         //获取绘图区对象    
         CategoryPlot loanRemianPlot = loanRemainChart.getCategoryPlot();    
         loanRemianPlot.setBackgroundPaint(Color.BLUE); // 设置绘图区背景色    
         loanRemianPlot.setRangeGridlinePaint(Color.WHITE); // 设置水平方向背景线颜色    
         loanRemianPlot.setRangeGridlinesVisible(true);// 设置是否显示水平方向背景线,默认值为true    
         loanRemianPlot.setDomainGridlinePaint(Color.WHITE); // 设置垂直方向背景线颜色    
         loanRemianPlot.setDomainGridlinesVisible(true); // 设置是否显示垂直方向背景线,默认值为false    


         CategoryAxis loanRemainDomainAxis = loanRemianPlot.getDomainAxis();       
         loanRemainDomainAxis.setLabelFont(font); // 设置横轴字体    
         loanRemainDomainAxis.setTickLabelFont(font);// 设置坐标轴标尺值字体    
         loanRemainDomainAxis.setLowerMargin(0.01);// 左边距 边框距离    
         loanRemainDomainAxis.setUpperMargin(0.06);// 右边距 边框距离,防止最后边的一个数据靠近了坐标轴。    
         loanRemainDomainAxis.setMaximumCategoryLabelLines(2);    

         ValueAxis loanRemainRangeAxis = loanRemianPlot.getRangeAxis();    
         loanRemainRangeAxis.setLabelFont(font);     
         loanRemainRangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());//Y轴显示整数    
         loanRemainRangeAxis.setAutoRangeMinimumSize(1);   //最小跨度    
         loanRemainRangeAxis.setUpperMargin(0.18);//上边距,防止最大的一个数据靠近了坐标轴。       
         loanRemainRangeAxis.setLowerBound(0);   //最小值显示0    
         loanRemainRangeAxis.setAutoRange(false);   //不自动分配Y轴数据    
         loanRemainRangeAxis.setTickMarkStroke(new BasicStroke(1.6f));     // 设置坐标标记大小    
         loanRemainRangeAxis.setTickMarkPaint(Color.BLACK);     // 设置坐标标记颜色    


         // 获取折线对象    
         LineAndShapeRenderer loanRemainRenderer = (LineAndShapeRenderer) loanRemianPlot.getRenderer();    
         loanRemainRenderer.setBaseItemLabelsVisible(true);  
         loanRemainRenderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(    
                 ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_CENTER));    
         loanRemainRenderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());  //显示节点的数值  
         loanRemainRenderer.setBaseItemLabelPaint(new Color(102, 102, 102));  
           
         BasicStroke realLine = new BasicStroke(1.8f); // 设置实线    
         // 设置虚线    
         float dashes[] = { 5.0f };     
         BasicStroke brokenLine = new BasicStroke(2.2f, // 线条粗细    
                 BasicStroke.CAP_ROUND, // 端点风格    
                 BasicStroke.JOIN_ROUND, // 折点风格    
                 8f, dashes, 0.6f);     
         for (int i = 0; i < chartDate.getRowCount(); i++) {    
             if (i % 2 == 0)    
                 loanRemainRenderer.setSeriesStroke(i, realLine); // 利用实线绘制    
             else    
                 loanRemainRenderer.setSeriesStroke(i, brokenLine); // 利用虚线绘制    
         }    

        
         HttpServletResponse response=ServletActionContext.getResponse();
    	response.setContentType("image/");
			ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 1.0f, loanRemainChart, 800, 650, null);
			response.getOutputStream().close();
			/*-------将图片保存起来--------*/
			FileOutputStream fos = null;  
			String imagePath = "C://Users//Administrator//Desktop//chart3.jpg";
			ChartRenderingInfo info = new ChartRenderingInfo(); 
			try {
				fos = new FileOutputStream(imagePath);
				//将统计图标输出成JPG文件 
				ChartUtilities.writeChartAsJPEG( 
					fos, //输出到哪个输出流 
					1, //JPEG图片的质量，0~1之间 
					loanRemainChart, //统计图标对象 
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
			return null;
	}
}
