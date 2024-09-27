package fullstack7.member;

import java.time.LocalDateTime;

public class MemberVO extends AbstractMember {
    private final String userId;
    private final String name;
    private final String pwd;
    private final String ssn;
    private final String addr1;
    private final String addr2;
    private final String birthday;
    private final String jobCode;
    private final Integer mileage;
    private final String memberState;
    private final LocalDateTime regDate;
    private final LocalDateTime pwdChangeDate;

    public MemberVO(String userId, String name, String pwd, String ssn, String addr1, String addr2,
                    String birthday, String jobCode, Integer mileage, String memberState,
                    LocalDateTime regDate, LocalDateTime pwdChangeDate) {
        this.userId = userId;
        this.name = name;
        this.pwd = pwd;
        this.ssn = ssn;
        this.addr1 = addr1;
        this.addr2 = addr2;
        this.birthday = birthday;
        this.jobCode = jobCode;
        this.mileage = mileage;
        this.memberState = memberState;
        this.regDate = regDate;
        this.pwdChangeDate = pwdChangeDate;
    }

    public String getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }

    public String getPwd() {
        return pwd;
    }

    public String getSsn() {
        return ssn;
    }

    public String getAddr1() {
        return addr1;
    }

    public String getAddr2() {
        return addr2;
    }

    public String getBirthday() {
        return birthday;
    }

    public String getJobCode() {
        return jobCode;
    }

    public Integer getMileage() {
        return mileage;
    }

    public String getMemberState() {
        return memberState;
    }

    public LocalDateTime getRegDate() {
        return regDate;
    }

    public LocalDateTime getPwdChangeDate() {
        return pwdChangeDate;
    }
}
