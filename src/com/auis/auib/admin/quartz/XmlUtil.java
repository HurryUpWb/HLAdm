package com.auis.auib.admin.quartz;

import java.io.StringReader;
import java.io.StringWriter;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.PropertyException;
import javax.xml.bind.Unmarshaller;

/**
 * 
 * @author wangb
 *
 */
public class XmlUtil {
	
	//将对象写成Xml
	public static String  WriteToXml(Object obj,String encoding) {
		String res="";
		StringWriter writer=new StringWriter();
		try {
			JAXBContext context=JAXBContext.newInstance(obj.getClass());
			Marshaller marshaller=context.createMarshaller();
			marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			marshaller.setProperty(Marshaller.JAXB_ENCODING, encoding);
			marshaller.marshal(obj, writer);
			res=writer.toString();
		} catch (PropertyException e) {
			e.printStackTrace();
		} catch (JAXBException e) {
			e.printStackTrace();
		}
		
		return res;
		
	}
	//将Xml写成对象
	public static <T> Object WriteToObj(T obj,String xml){
		Object object=null;
		try {
			JAXBContext context=JAXBContext.newInstance(obj.getClass());
			Unmarshaller unmarshaller=context.createUnmarshaller();
			object=(T)unmarshaller.unmarshal(new StringReader(xml));
		} catch (JAXBException e) {
			e.printStackTrace();
		}
		return object;
	}
}
