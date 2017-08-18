package cn.edu.gdin.Aaction;

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
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.title.LegendTitle;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.DefaultCategoryDataset;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.gdin.demo.TCS;
import cn.edu.gdin.service.TCSCountService;



public class ChartSCAction extends ActionSupport{
	private TCSCountService tCSCountService;
	public void settCSCountService(TCSCountService tCSCountService) {
		this.tCSCountService = tCSCountService;
	}

	
	
	public String execute() throws Exception{
		 //添加数据
				DefaultCategoryDataset dataset = new DefaultCategoryDataset();
				List<TCS> list = this.tCSCountService.admin_count();
				
				for(int i=0;i<list.size();i++){
					if(list.get(i).getStucount()!=0){
				        dataset.addValue(list.get(i).getStucount(),"课程名", list.get(i).getCname());
					}
				}
				//创建一个柱状图
				
				JFreeChart chart = ChartFactory.createBarChart3D("学生选课统计图", "课程名", "学生数",dataset,PlotOrientation.VERTICAL, true, false, false);
				chart.setTitle(new TextTitle("学生选课统计图", new Font("黑体", Font.ITALIC,22)));
				// 设置整个图片的背景色  
	            chart.setBackgroundPaint(Color.WHITE);  
	            // 设置图片有边框  
	            chart.setBorderVisible(true); 
				LegendTitle legend = chart.getLegend(0);
				legend.setItemFont(new Font("宋体", Font.BOLD, 14));
				CategoryPlot plot = (CategoryPlot) chart.getPlot();
				CategoryAxis categoryAxis = plot.getDomainAxis();
				categoryAxis.setLabelFont(new Font("宋体", Font.BOLD, 22));
				categoryAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);
				categoryAxis.setTickLabelFont(new Font("宋体", Font.BOLD, 18));
				NumberAxis numberaxis = (NumberAxis) plot.getRangeAxis();  
	            numberaxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());  
	            BarRenderer3D barrenderer = (BarRenderer3D) plot.getRenderer();  
	            barrenderer.setBaseItemLabelFont(new Font("宋体", Font.PLAIN, 12));  
	            barrenderer.setSeriesItemLabelFont(1, new Font("宋体", Font.PLAIN, 12)); 
	                   barrenderer.setSeriesPaint(0,Color.BLUE);
	                   
	            CategoryAxis domainAxis = plot.getDomainAxis();           
	            /*------设置X轴坐标上的文字-----------*/  
	            domainAxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 11));  
	            /*------设置X轴的标题文字------------*/  
	            domainAxis.setLabelFont(new Font("宋体", Font.PLAIN, 12));  
	            /*------设置Y轴坐标上的文字-----------*/  
	            numberaxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 12));  
	            /*------设置Y轴的标题文字------------*/  
	            numberaxis.setLabelFont(new Font("宋体", Font.PLAIN, 12));  
	            /*------这句代码解决了底部汉字乱码的问题-----------*/  
	            chart.getLegend().setItemFont(new Font("宋体", Font.PLAIN, 12));  
				HttpServletResponse response=ServletActionContext.getResponse();
				response.setContentType("image/");
				ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 1, chart, 800, 650, null);
				response.getOutputStream().close();
				/*-------将图片保存起来--------*/
				FileOutputStream fos = null;  
				String imagePath = "C://Users//Administrator//Desktop//chart.jpg";
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
				return null;
		}
	
}
