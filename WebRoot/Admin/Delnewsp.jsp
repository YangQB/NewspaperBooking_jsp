<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>ɾ������</title>
  </head>
  <body>
    <div class="right-top">
                    ����Ա�˺ţ�
      <% String aid=(String)session.getAttribute("aid");
         out.println(aid);
         if(aid==null)
         {
             %>
                 <Script Language="JavaScript">
                        alert("ɾ������ʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else{
      %>   
    </div>
    <div>
      <h1>�������Ĺ���ϵͳ����ɾ������</h1><br />
        <%
            //ֻ��admin_2����Աӵ��ɾ��������Ȩ��
            if(aid.equals("admin_2")){
                //�������ݿ�
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
                String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_admin;password=admin;useUnicode=true;characterEncoding=GB2312";
                Connection conn = DriverManager.getConnection(url);
            
                //ȡ����ѡ��ѡ�е�ֵ
                String result[]=request.getParameterValues("check");
                if(result!=null)
                {
                    for(int i=0;i<result.length;i++){
                        String sql_1="SELECT * FROM [BOOKING] WHERE NID='"+result[i]+"'";
                        Statement stmt_1 = conn.createStatement();
                        ResultSet rs_1 = stmt_1.executeQuery(sql_1);
                        if(rs_1.next())
                        {
                        %>
                            <Script Language="JavaScript">
                              alert("�ñ�������>0�����б����ļ�¼�����ܱ�ɾ����");
                              window.location.href="Newsp_a.jsp"; 
                            </Script>
                        <%
                        }
                        else{
                            String sql_3="DELETE  FROM [NEWSPAPER] WHERE NID='"+result[i]+"'";
                            Statement stmt_3 = conn.createStatement();
                            stmt_3.executeUpdate(sql_3);
                            %>
                                <Script Language="JavaScript">
                                    alert("ɾ���ɹ���");
                                    window.location.href="Newsp_a.jsp"; 
                                </Script>
                            <%
                            stmt_3.close();
                        }
                        rs_1.close();
                        stmt_1.close();
                     }   
                }
                else{
                %>
                    <Script Language="JavaScript">
                        alert("δѡ��ɾ���ı�����");
                        window.location.href="Newsp_a.jsp"; 
                    </Script>
                <%
                }
                conn.close();
            }else{
                %>
                    <Script Language="JavaScript">
                        alert("����ԱȨ�޲��㣬�޷�ɾ��������");
                        window.location.href="Admin.jsp"; 
                    </Script>
                    
                <%
            }
            }
	 	  %>
    </div>
  </body>
</html>