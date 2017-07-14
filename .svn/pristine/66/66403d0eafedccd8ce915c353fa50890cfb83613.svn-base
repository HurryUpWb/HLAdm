package com;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.jfinal.plugin.activerecord.Record;

public class UtilString {

	/**
	 * 求两个数组的差集
	 * @param 求差集的数组
	 * @param 求差集的数组
	 * @return 两个数组的差集
	 */
	public static String[] minus(String[] arr1, String[] arr2) {
		LinkedList<String> list = new LinkedList<String>();
		LinkedList<String> history = new LinkedList<String>();
		String[] longerArr = arr1;
		String[] shorterArr = arr2;
		if (arr1.length > arr2.length) {
			longerArr = arr2;
			shorterArr = arr1;
		}
		for (String str : longerArr) {
			if (!list.contains(str)) {
				list.add(str);
			}
		}
		for (String str : shorterArr) {
			if (list.contains(str)) {
				history.add(str);
				list.remove(str);
			} else {
				if (!history.contains(str)) {
					list.add(str);
				}
			}
		}
		String[] result = {};
		return list.toArray(result);
	}
	
   /**
     * 将结果集LIST进行组合 
     * @param dimvalue原List
     * @param result通过乘积转化后的数组
     * @param layer
     *            中间参数
     * @param curList
     *            中间参数
     */
    @SuppressWarnings("unused")
	private static void descartes(List<List<Record>> dimvalue,
            List<List<Record>> result, int layer, List<Record> curList) {
        if (layer < dimvalue.size() - 1) {
            if (dimvalue.get(layer).size() == 0) {
            	UtilString.descartes(dimvalue, result, layer + 1, curList);
            } else {
                for (int i = 0; i < dimvalue.get(layer).size(); i++) {
                    List<Record> list = new ArrayList<Record>(curList);
                    list.add(dimvalue.get(layer).get(i));
                    UtilString.descartes(dimvalue, result, layer + 1, list);
                }
            }
        } else if (layer == dimvalue.size() - 1) {
            if (dimvalue.get(layer).size() == 0) {
                result.add(curList);
            } else {
                for (int i = 0; i < dimvalue.get(layer).size(); i++) {
                    List<Record> list = new ArrayList<Record>(curList);
                    list.add(dimvalue.get(layer).get(i));
                    result.add(list);
                }
            }
        }
    }
}