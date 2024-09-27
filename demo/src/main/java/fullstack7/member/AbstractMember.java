package fullstack7.member;

import java.time.LocalDateTime;

public abstract class AbstractMember {
    protected String userId;
    protected String name;
    protected String pwd;
    protected String ssn;
    protected String addr1;
    protected String addr2;
    protected String birthday;
    protected String jobCode;
    protected Integer mileage;
    protected String memberState;
    protected LocalDateTime regDate;
    protected LocalDateTime pwdChangeDate;
}
