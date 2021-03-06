package com.yc.fs.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import com.mongodb.DBObject;

/**
 * 全站检索
 * @author cyp
 *
 */
public class LuceneUtil {
	
	/**
	 * 建立索引
	 * @param li
	 */
	public void Index(List<DBObject> li) {
		try {
			//IndexWriter writer = new IndexWriter("d:/index/", getAnalyzer(), true);
			//索引保存地址
			Directory fsDir = FSDirectory.open(new File("F:/index/").toPath());
			//获取分词器
			IndexWriterConfig iwconf = new IndexWriterConfig(getAnalyzer()); 
			IndexWriter writer = new IndexWriter(fsDir, iwconf);
			writer.deleteAll(); //将前面的索引清空
			
			//开始建立索引
			for(DBObject rs:li){
				Document doc = new Document();
				doc.add(new Field("pname", rs.get("pname").toString(), TextField.TYPE_STORED));
				doc.add(new Field("pcontent", rs.get("pcontent").toString(), TextField.TYPE_STORED));
				doc.add(new Field("_id", rs.get("_id").toString(), TextField.TYPE_STORED));
				writer.addDocument(doc);
			}
			//writer.optimize();			
			writer.close();
		} catch (IOException e) {
			System.out.println(e);
		}
	}

	public Analyzer getAnalyzer() {
		return new StandardAnalyzer();
	}
	
	/**
	 * 根据关键词搜索
	 * @param str
	 */
	public List<Map<String,String>> search(String str){
		List<Map<String,String>> list=new ArrayList<Map<String,String>>();
		
		 // Now search the index:
		try {
			Directory fsDir = FSDirectory.open(new File("d:/index/").toPath());
			DirectoryReader ireader = DirectoryReader.open(fsDir);
			IndexSearcher isearcher = new IndexSearcher(ireader);
			// Parse a simple query that searches for "text":
			//查询的索引
			QueryParser parser = new QueryParser("pname", getAnalyzer());
			
			//MultiFieldQueryParser parser=new MultiFieldQueryParser(new String[]{"pname","pcontent"},getAnalyzer());
			//查询的关键字
			Query query = parser.parse(str);
			
			//20，查询的指定条数
			ScoreDoc[] hits = isearcher.search(query, 20).scoreDocs;
			//assertEquals(1, hits.length);
			// Iterate through the results:
			//取出所有查到的值，并添加到list中
			for (int i = 0; i < hits.length; i++) {
			  Document hitDoc = isearcher.doc(hits[i].doc);
			  //assertEquals("This is the text to be indexed.", hitDoc.get("fieldname"));
			  Map<String,String> map=new HashMap<String,String>();
			  map.put("pname", hitDoc.get("pname"));
			  map.put("pcontent", hitDoc.get("pcontent"));			  
			  map.put("_id", hitDoc.get("_id"));			  
			  list.add(map);
			}
			ireader.close();
			fsDir.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
