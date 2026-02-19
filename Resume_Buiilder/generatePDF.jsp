<%@ page import="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>
<%@ page import="java.io.*" %>

<%
response.setContentType("application/pdf");
response.setHeader("Content-Disposition", "attachment; filename=Resume.pdf");

Document document = new Document(PageSize.A4, 50, 50, 50, 50);
PdfWriter.getInstance(document, response.getOutputStream());
document.open();

// Fonts
Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
Font headerFont = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
Font textFont = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);

// Name Title
Paragraph name = new Paragraph(request.getParameter("name"), titleFont);
name.setAlignment(Element.ALIGN_CENTER);
document.add(name);

document.add(new Paragraph(" "));

// Contact Details
Paragraph contact = new Paragraph(
"Email: " + request.getParameter("email") + "\nPhone: " + request.getParameter("phone"), textFont);
contact.setAlignment(Element.ALIGN_CENTER);
document.add(contact);

document.add(new Paragraph("--------------------------------------------------"));

// Skills
Paragraph skillHeader = new Paragraph("Skills", headerFont);
document.add(skillHeader);
document.add(new Paragraph(request.getParameter("skills"), textFont));

document.add(new Paragraph(" "));

// Education
Paragraph eduHeader = new Paragraph("Education", headerFont);
document.add(eduHeader);
document.add(new Paragraph(request.getParameter("education"), textFont));

document.add(new Paragraph(" "));

// Experience
Paragraph expHeader = new Paragraph("Experience", headerFont);
document.add(expHeader);
document.add(new Paragraph(request.getParameter("experience"), textFont));

document.close();
%>
