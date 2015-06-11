# EgovSample
### 전자정부 프레임워크 간소화
> 일반게시판 및 axisJ 이용게시판 샘플이 구현 되어 있습니다.

### 개발환경
- JDK : 1.6.0_45
- WAS : Tomcat 7.0
- DB : HSQL (스프링지원 내장형 메모리 DB)

### 프로젝트 구조 간략설명
- java/egovframework.sample/aop : 테스트용 AOP관련 클래스 모음
- java/egovframework.sample/service : service 인터페이스 및 vo클래스, service 인터페이스 구현클래스(*Impl)및 DAO클래스(*DAO)
- java/egovframework.sample/web : Spring MVC의 Controller 클래스
- resources/db : 내장형 DB 초기화 스크립트
- resources/egovframework/spring : 루트 컨텍스트(최상위 설정파일)로 web.xml의 org.springframework.web.context.ContextLoaderListener에서 읽어들임
- resources/egovframework/sqlmap : sql-map-config.xml(iBatis 설정파일) 및 쿼리맵파일 
- webapp/common/ : error jsp파일 모음
- webapp/css : css파일 모음
- webapp/js : javascript 파일 모음
- webbapp/WEB-INF/config : 프레젠테이션영역용 컨텍스트(자식 설정파일)로 resources/egovframework/spring/밑의 컨텍스트를 부모로 가짐, Controller Bean생성및 view resolver 설정, egovframework에서 제공하는 paging bean설정등을 여기서 구성했음
- webbapp/WEB-INF/jsp : view영역으로 controller bean에서 처리된 model이 전달되어진다
