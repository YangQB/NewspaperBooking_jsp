<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>��ӱ���</title>
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
                        alert("��ӱ���ʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }
      %>
    </div>
    <div>
      <h1>�������Ĺ���ϵͳ������ӱ���</h1><br />
      <form name="myform_7" method="post" onsubmit="return checkinput(this);" action="Checkadd.jsp">
        <table>
          <tr>
            <td>��&nbsp;��&nbsp;�� &nbsp;��</td>
            <td><input type="text" name="nid" maxlength="5"/></td>
            <td class="spe2">�����뱨����(5λ)</td>
          </tr>
          <tr>
            <td>�������ƣ�</td>
            <td><input type="text" name="nname" maxlength="20"/></td>
            <td class="spe2">�����뱨������(20λ)</td>
          </tr>
          <tr>
            <td>���汨�磺</td>
            <td><input type="text" name="nps" maxlength="20"/></td>
            <td class="spe2">��������汨������(20λ)</td>
          </tr>
          <tr>
            <td>�������ڣ�</td>
            <td><input type="text" name="npd" maxlength="3"/></td>
            <td class="spe2">(����Ϊ��λ)������������</td>
          </tr>
          <tr>
            <td>���ȱ��ۣ�</td>
            <td><input type="text" name="nct" maxlength="3"/></td>
            <td class="spe2">(��ԪΪ��λ)������������</td>
          </tr>
          <tr>
            <td>���ݽ��ܣ�</td>
            <td><input type="text" name="npr" maxlength="30"/></td>
            <td class="spe2">�����뱨����(5λ)</td>
          </tr>
          <tr>
            <td>�ɶ�������</td>
            <td><input type="text" name="nnum" maxlength="3"/></td>
            <td class="spe2">(�Է�Ϊ��λ)������������</td>
          </tr>
          <tr>
            <td>�������ƣ�</td>
            <td><select name="sid" >
                    <option value="01">ʱ������ </option>                 
                    <option value="02">��������</option>
                    <option value="03">��������</option>
                    <option value="04">�������� </option>
                    <option value="05">�������� </option>  
                    <option value="06">��������</option>                 
                    <option value="07">��������</option>        
                 </select>
            </td>
            <td class="spe2">��ѡ�񱨿����</td>
          </tr>
          <tr>
             <td></td>
             <td><input type="submit" value="ȷ�����" /></td>
             <td></td>
          </tr>
        </table> 
                               
      </form>
      <table>
          <tr>
            <td>
              <a href="Admin.jsp"><img class="small" src="../pics/admin.ico" alt="����Աҳ��" />����Աҳ��</a>
            </td>
            <td>
              <a href="Newsp_a.jsp"><img class="small" src="../pics/newsp.ico" alt="�鿴����" />�鿴����</a>
            </td>
          </tr>
      </table>
    </div>
    
    <script type="text/javascript"> 
	  function checkinput(myform_7)
      {
         //�Ƿ������û��˺�
         if(myform_7.nid.value=="")
         {
           alert("�����������ʽ����!");
           return false;
         }
         if(myform_7.nname.value=="")
         {
           alert("�������Ʊ����������ʽ����!");
           return false;
         }
         if(myform_7.nps.value=="")
         {
           alert("���汨�籨���������ʽ����!");
           return false;
         }
         if(myform_7.npd.value=="")
         {
           alert("�������ڱ����������ʽ����!");
           return false;
         }
         if(myform_7.nct.value=="")
         {
           alert("���ȱ��۱����������ʽ����!");
           return false;
         }
         if(myform_2.npr.value=="")
         {
           alert("���ݽ��ܱ����������ʽ����!");
           return false;
         }
         if(myform_2.nnum.value=="")
         {
           alert("�ɶ����������������ʽ����!");
           return false;
         }
         if((!isN(docment.myform_7.npd))||(!isN(docment.myform_7.npd))||(!isN(docment.myform_7.npd)))
         {  
           alert("�������ڣ����ȱ��ۣ��ɶ�����������ֻ��Ϊ����!");
           return false;
         }  
      }
      function isN(str){
         reg = /^d{1,3}$/;
         reg.test(str);
      }
     </script>
  </body>
</html>