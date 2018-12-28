package handler.admin.data;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;

public class log_to_sql {
	//함수:insert 문으로 환산
	public static String line_to_insert(String line){
		String[] items=line.split(",");
		String insert_sql="insert into mh_order_history(order_no,order_qnt,order_date,menu_id,cus_id,store_id,order_status) values(";
		insert_sql+=items[6]/*주문번호*/+","+items[13]+",";
		insert_sql+="to_date('"+items[0]+"-"+items[1]+"-"+items[2]+"-"+items[3]+"-"+items[4]+"-"+items[5]+"', 'YYYY-MM-DD-HH24-mi-ss'),";
		insert_sql+=items[11]+",'"+items[7]+"','"+items[14]+"',3);\n";
		return insert_sql;
	}
		
	public static void main(String[] args) throws IOException {
		//시작시간
		long start = System.currentTimeMillis();
		
		//새 파일 열기
		FileOutputStream new_file = new FileOutputStream("c:/home/log_to_sql.txt");
		
		BufferedReader old_file = new BufferedReader(new FileReader("c:/home/one_log.txt"));
		
		new_file.write("delete from mh_order_history;\n".getBytes());
        while(true) {
            String line = old_file.readLine();
            if (line==null) break;
            
            String data = line_to_insert(line);
            new_file.write(data.getBytes());
        }
        new_file.write("commit;\n".getBytes());
        new_file.close();
        old_file.close();
        
        // 끝 시간 출력
     	long end = System.currentTimeMillis();
     	System.out.println( "실행 시간 : " + ( end - start )/1000.0 );
	}//main
}//class
