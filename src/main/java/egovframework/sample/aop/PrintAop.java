package egovframework.sample.aop;

public class PrintAop {

    public void printBeforeAop() {
        System.err.println("AOP메소드 실행 -> 메소드 실행전");
    }
    public void printAfterAop() {
        System.err.println("AOP메소드 실행 -> 메소드 실행후");
    }
}
