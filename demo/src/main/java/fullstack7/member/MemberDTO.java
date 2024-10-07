package fullstack7.member;

import java.lang.reflect.Member;
import java.util.*;

import java.time.LocalDateTime;

public class MemberDTO extends AbstractMember {

    private String AutoLoginFlag;

    //자동로그인 flag 추가
    public MemberDTO() {
    }

    public MemberDTO(String userId, String name, String pwd, String ssn, String addr1, String addr2, String birthday,
                     String jobCode, Integer mileage, String memberState, LocalDateTime regDate,
                     LocalDateTime pwdChangeDate) {
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

    public MemberDTO(String userId, String name, String pwd) {
        this.userId = userId;
        this.name = name;
        this.pwd = pwd;
    }


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getSsn() {
        return ssn;
    }

    public void setSsn(String ssn) {
        this.ssn = ssn;
    }

    public String getAddr1() {
        return addr1;
    }

    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    public String getAddr2() {
        return addr2;
    }

    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getJobCode() {
        return jobCode;
    }

    public void setJobCode(String jobCode) {
        this.jobCode = jobCode;
    }

    public Integer getMileage() {
        return mileage;
    }

    public void setMileage(Integer mileage) {
        this.mileage = mileage;
    }

    public String getMemberState() {
        return memberState;
    }

    public void setMemberState(String memberState) {
        this.memberState = memberState;
    }

    public LocalDateTime getRegDate() {
        return regDate;
    }

    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
    }

    public LocalDateTime getPwdChangeDate() {
        return pwdChangeDate;
    }

    public void setPwdChangeDate(LocalDateTime pwdChangeDate) {
        this.pwdChangeDate = pwdChangeDate;
    }

    public String getAutoLoginFlag() {
        return AutoLoginFlag;
    }

    public void setAutoLoginFlag(String autoLoginFlag) {
        AutoLoginFlag = autoLoginFlag;
    }

}
