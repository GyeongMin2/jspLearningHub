package dto;

public class StudentDTO {
    private String name;
    private int grade;
    private String dept;
    private String no;
    private int age;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public StudentDTO(String no, String name, int grade, int age, String dept) {
        this.no = no;
        this.name = name;
        this.grade = grade;
        this.age = age;
        this.dept = dept;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    @Override
    public String toString() {
        return "StudentDTO{" +
                "no : '" + no + "', name : '" + name + "', grade : " + grade + ", age : " + age + ", dept : '" + dept + "'}";
    }

    public String toJSONObject() {
        return "{" +
                "no : '" + no + "', name : '" + name + "', grade : " + grade + ", age : " + age + ", dept : '" + dept + "'}";
    }
}
