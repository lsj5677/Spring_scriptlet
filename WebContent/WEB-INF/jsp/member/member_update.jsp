<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="com.spring.member.dao.MemberMapper" %>
<%@ page import ="com.spring.member.dao.MemberMapperImpl" %> 
<%@ page import ="com.spring.member.vo.MemberVO" %> 
<%@ page import = "java.util.ArrayList"%>
<%@ page import ="java.util.List" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update</title>
		<style>
			.table {border:1px solid #ccc; width:500px; margin:0 auto; border-collapse:collapse; font-size:13px;}
			.table tr {border:1px solid #ddd; height: 40px;}
			.table tr:nth-child(odd) {background-color:#f3f3f3;}
			.table .table_title {text-align:center; font-size:15px;}
			.table tr td {padding:15px 0;} 
			.table tr .info_title {text-align:center;border:1px solid #ddd; }
			.table tr .info_input {padding: 15px 20px; border-left:1px solid #ddd;}
			.table tr .info_input input {padding:5px; box-sizing:border-box; width: 100%; border: 1px solid #ccc;}
			.table tr .info_input input.postno {padding:5px; box-sizing:border-box; width: 66%; border: 1px solid #ccc;}
			.table tr .info_input .btn {padding:5px; box-sizing:border-box; width: 32%; border: 1px solid #ccc;}
			.table tr .info_input span {display:block; font-size:11px; line-height:2; padding-top: 5px; text-align:right;}
			.table tr .info_button {text-align:center;}
			.table tr .info_button .btn{ border:none; background-color:#ddd; padding: 8px; width: 90px; box-sizing: border-box; cursor:pointer;}
			.table tr .info_button .btn:hover {background-color:#222; color:#fff; transition: all .3s ease;}
			.table tr .info_button .btn#retry {background-color:#cf0000; color:#fff;}
		</style>
		<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.11.0.min.js"></script> 
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			$(function(){
				$("#listData").click(function(){
					alert("listData >>>>> ");
					$("#memberUpdate").attr("action","/member/listMem.lsj");
				});	
				
				$("#updateData").click(function(){
					alert("updateData >>>>> ");
					if(confirm('������ �����ұ��?')){
						$("#memberUpdate").attr("action","/member/updateMem.lsj");
						$("#memberUpdate").submit();
					}
				});	
			});
			 function sample4_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
	
			                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
			                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
			                var roadAddr = data.roadAddress; // ���θ� �ּ� ����
			                var extraRoadAddr = ''; // ���� �׸� ����
	
			                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
			                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
			                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
			                    extraRoadAddr += data.bname;
			                }
			                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
			                if(data.buildingName !== '' && data.apartment === 'Y'){
			                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                }
			                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
			                if(extraRoadAddr !== ''){
			                    extraRoadAddr = ' (' + extraRoadAddr + ')';
			                }
	
			                // ������ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
			                document.getElementById('lpostno').value = data.zonecode;
			                document.getElementById("ljuso").value = roadAddr;
			                
	
			                document.getElementById("ljuso1").focus();
			            }
			        }).open();
			    }
		</script>
	</head>
	<body>          
		<!-- form -->
			<form id="memberUpdate" name="memberUpdate" method="POST">
			<%
			
					
				MemberVO lvo = (MemberVO)request.getAttribute("memberVO");
				
					
				%>
				<!-- table -->
				<table class="table">
					<tr>
						<td class="info_title" colspan="3">ȸ����������</td>						
					</tr>
					<tr>
						<td rowspan="6" class="info_title"><img src = "./upload/<%=lvo.getLimage()%>" border=0 width="150" height="100" readonly></td>
						<td class="info_title">ȸ����ȣ</td>
						<td class="info_input">
							<input type="text" name="lmem" id="lmem" value=<%=lvo.getLmem() %> readonly>
						</td>
					</tr>
					
					<tr>
						<td class="info_title">���̵�</td>
						<td class="info_input">
							<input type="text" name="lid" id="lid" placeholder="���̵� �Է��ϼ���" value=<%=lvo.getLid() %> readonly>
						</td>
					</tr>
					<!-- tr -->
					<tr>
						<td class="info_title">��й�ȣ</td>
						<td class="info_input"><input type="password" name="lpw" id="lpw" placeholder="��й�ȣ�� �Է��ϼ���" value=<%=lvo.getLpw() %>/></td>
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="info_title">�̸�</td>
						<td class="info_input"><input type="text" name="lname" id="lname" placeholder="�̸��� �Է��ϼ���" value=<%=lvo.getLname() %> /></td>
					</tr>
					<!-- //tr -->
					<!-- //tr -->
					<tr>
						<td class="info_title">����</td>
						<td class="info_input">
						<input type="text" name="lgender" id="lgender" placeholder="M or F"  value=<%=lvo.getLgender() %> readonly/>
						</td>
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="title info_title">�������</td>
						<td class="info_input">
							<input type="text" name="lbirth" placeholder="YYMMDD" value=<%=lvo.getLbirth() %> readonly>
						</td>
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="info_title">�̸���</td>
						<td colspan="2" class="info_input">
						<input type="text" name="lemail" placeholder="�̸����� �Է��ϼ���" value=<%=lvo.getLemail() %>>
						</td>
					</tr>
					<!-- //tr -->
					<!-- tr -->
					<tr>
						<td class="info_title">�޴�����ȣ</td>
						<td colspan="2" class="info_input">
						<input type="text" name="lhp" placeholder="������ ���� �Է��ϼ���" value=<%=lvo.getLhp() %>>
						</td>
					</tr>
					<!-- //tr -->
					<tr>
						<td class="info_title">������ȣ</td>
						<td  colspan="2" class="info_input">
						<!-- input type="text" name="lpostno" placeholder="������ȣ 5�ڸ�"-->
							<input type="text" id="lpostno" class="postno" name="lpostno" placeholder="������ȣ" value=<%=lvo.getLpostno() %>>
							<input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="������ȣ ã��"><br>
							
						</td>
					</tr>
					<tr>
						<td class="info_title">�ּ�</td>
						<td  colspan="2" class="info_input">
							<input type="text" name="ljuso" id="ljuso" placeholder="���θ��ּ�" value="<%=lvo.getLjuso() %>" >
							<%-- <input type="text" name="ljuso1" id="ljuso1" placeholder="���ּ�" value=<%=lvo.getLjuso1() %>> --%>
							
						</td>
						
					</tr>
				
					<tr>
						<td colspan="3" class="info_button">
							<input type="button" value="����" id="updateData" name="updateData" class="btn">
							<input type="button" value="ȸ�����" id="listData" name="listData" class="btn">
						</td>
					</tr>
					<!-- //tr -->
				</table>
				<!-- //table -->
			</form>
		
	</body>
</html>