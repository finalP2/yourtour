<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
   <link href="http://fonts.googleapis.com/css?family=Arimo:400" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도시 리스트</title>

<style>

.menu .accordion-heading {  position: relative; }
.menu .accordion-heading .edit {
    position: absolute;
    top: 8px;
    right: 30px; 
}
.menu .area { border-left: 4px solid #f38787; }
.menu .equipamento { border-left: 4px solid #65c465; }
.menu .ponto { border-left: 4px solid #98b3fa; }
.menu .collapse.in { overflow: visible; }

</style>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-12">
    	    <div class="sidebar-nav">
                <div class="accordion">
                    <!-- Áreas -->
                    <div class="accordion-group">
                        <!-- Área -->
                        <div class="accordion-heading area">
                            <a class="accordion-toggle" data-toggle="collapse" href=
                            "#area1">프랑스</a>
                        </div><!-- /Área -->
            
                        <div class="accordion-body collapse" id="area1">
                            <div class="accordion-inner">
                                <div class="accordion" id="equipamento1">
                                    <!-- Equipamentos -->
            
                                    <div class="accordion-group">
                                        <div class="accordion-heading equipamento">
                                            <a data-parent=
                                            "#equipamento1-1" data-toggle="collapse" href=
                                            "#ponto1-1">파리</a>
                                            <a data-parent=
                                            "#equipamento1-1" data-toggle="collapse" href=
                                            "#ponto1-1">깐느</a>
                                            <a data-parent=
                                            "#equipamento1-1" data-toggle="collapse" href=
                                            "#ponto1-1">니스</a>
                                        </div><!-- Pontos -->
                                        
                    <!-- Áreas -->
                    <div class="accordion-group">
                        <!-- Área -->
                        <div class="accordion-heading area">
                            <a class="accordion-toggle" data-toggle="collapse" href=
                            "#area1">독일</a>
                        </div><!-- /Área -->
            
                        <div class="accordion-body collapse" id="area2">
                            <div class="accordion-inner">
                                <div class="accordion" id="equipamento2">
                                    <!-- Equipamentos -->
                                        
                                    <div class="accordion-group">
                                        <div class="accordion-heading equipamento">
                                            <a data-parent=
                                            "#equipamento1-1" data-toggle="collapse" href=
                                            "#ponto1-1">베를린</a>
                                            <a data-parent=
                                            "#equipamento1-1" data-toggle="collapse" href=
                                            "#ponto1-1">함부르크</a>
                                            <a data-parent=
                                            "#equipamento1-1" data-toggle="collapse" href=
                                            "#ponto1-1">뮌헨</a>
                                        </div><!-- Pontos -->
            
                                       
                                    </div><!-- /Equipamentos -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /accordion -->
            </div> 
		</div>
	</div>
</div>

</body>
</html>
