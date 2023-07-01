<!-- flightForm.jsp    - 티켓 입력폼 작성 다듬기-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="../css/style.css"/>

<form method="post" action="trip_flight_result.jsp">
   <table>
    <tr>
      <td class="label"><label for="idt">아이디</label>
      <td class="content"><input id="idt" name="idt" type="text" size="20" 
          maxlength="50" placeholder="love1004" autofocus required>
    <tr>
      <td class="label"><label for="passwd">비밀번호</label>
      <td class="content"><input id="passwd" name="passwd" type="password" 
          size="20" placeholder="6~16자 숫자/문자" maxlength="16" required>
    <tr>
      <td class="label"><label for="name">이름</label>
      <td class="content"><input id="name" name="name" type="text" size="20" 
                 maxlength="10" placeholder="킹도라" required>
    <tr>
      <td class="label"><label for="name">주소</label>
      <td class="content"><input id="addr" name="addr" type="text" size="20" 
                 maxlength="100" placeholder="서울시" required>
    <tr>
      <td class="label"><label for="name">생년월일</label>
      <td class="content"><input id="birth_date" name="birth_date" type="text" size="20" 
                 maxlength="60" placeholder="2018-07-25" required>
    <tr>
      <td class="label"><label for="name">성별</label>
      <td class="content"><input id="sex" name="sex" type="text" size="20" 
                 maxlength="10" placeholder="여자/남자" required>
    <tr>
      <td class="label"><label for="name">가입일자</label>
      <td class="content"><input id="reg_date" name="reg_date" type="text" size="20" 
                 maxlength="10" placeholder="2018-07-25" required>   
              
    <tr>
      <td class="label2" colspan="2"><input type="submit" value="입력완료">
         <input type="reset" value="다시작성">
  </table>
</form>