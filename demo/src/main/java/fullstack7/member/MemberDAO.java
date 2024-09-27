package fullstack7.member;

import dbModule.MySqlDbModule;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.*;
import java.sql.Timestamp;

public class MemberDAO {
    public MemberDTO getMemberInfo(String userId, String pwd) {
        String sql = "SELECT userId, name, pwd, ssn, addr1, addr2, birthday, jobCode, mileage, memberState, regDate, pwdChangeDate FROM tbl_member WHERE userId = ? AND pwd = ?";
        MemberDTO member = null;

        try (
                MySqlDbModule mySqlDbModule = new MySqlDbModule();
//             MySqlDbModule mySqlDbModule2 = new MySqlDbModule(true); 다이렉트 연결
        ) {
            List<Map<String, Object>> resList = mySqlDbModule.getQueryResultList(sql, new String[]{userId, pwd});
            if (resList != null && !resList.isEmpty()) {
                member = mapToMemberDTO(resList.get(0));
//                member.setAutoLoginFlag()
            }
        } catch (SQLException e) {
//            e.printStackTrace();
            System.out.println("MemberDAO.getMemberInfo: SQLException: " + e.getMessage());
        }
        return member;
    }

    private MemberDTO mapToMemberDTO(Map<String, Object> memberMap) {
        MemberDTO member = new MemberDTO();
        member.setUserId((String) memberMap.get("userId"));
        member.setName((String) memberMap.get("name"));
        member.setPwd((String) memberMap.get("pwd"));
        member.setSsn((String) memberMap.get("ssn"));
        member.setAddr1((String) memberMap.get("addr1"));
        member.setAddr2((String) memberMap.get("addr2"));
        member.setBirthday((String) memberMap.get("birthday"));
        member.setJobCode((String) memberMap.get("jobCode"));
        member.setMileage((Integer) memberMap.get("mileage"));
        member.setMemberState((String) memberMap.get("memberState"));
        member.setRegDate((LocalDateTime) memberMap.get("regDate"));
        member.setPwdChangeDate((LocalDateTime) memberMap.get("pwdChangeDate"));

        return member;
    }

    public List<Map<String, Object>> getAllMemberInfo() {
        String sql = "SELECT * FROM tbl_member";
        List<Map<String, Object>> members = new ArrayList<>(); // 초기화

        try (MySqlDbModule mySqlDbModule = new MySqlDbModule()) {
            List<Map<String, Object>> resList = mySqlDbModule.getQueryResultList(sql);
            if (resList != null && !resList.isEmpty()) {
                members.addAll(resList);
            }
        } catch (SQLException e) {
//            e.printStackTrace();
            System.out.println("getAllMemberInfo: SQLException: " + e.getMessage());
        }
        return members;
    }

    public List<MemberDTO> getAllMemberInfoToDTO() {
        String sql = "SELECT userId, name, pwd, ssn, addr1, addr2, birthday, jobCode, mileage, memberState, regDate, pwdChangeDate FROM tbl_member";
        List<MemberDTO> memberList = new ArrayList<>();

        try (
                MySqlDbModule mySqlDbModule = new MySqlDbModule();
        ) {
            List<Map<String, Object>> resList = mySqlDbModule.getQueryResultList(sql);
            if (resList != null && !resList.isEmpty()) {
                for (Map<String, Object> map : resList) {
                    memberList.add(mapToMemberDTO(map));
                }
            }
        } catch (SQLException e) {
            System.out.println("getAllMemberInfo: SQLException: " + e.getMessage());
        }
        return memberList;
    }

    //    public int insertMember(LinkedHashMap<String, String> infoMap) {
//        String sql = "INSERT INTO FULLSTACK7.tbl_member (userId, name, pwd, ssn, addr1, addr2, birthday, jobCode) VALUES (?, ?, sha2(?,256), ?, ?, ?, ?, ?)";
//        int res = 0;
//
//        try (MySqlDbModule mySqlDbModule = new MySqlDbModule()) {
//            String[] parameters = infoMap.values().toArray(new String[0]);
//            res = mySqlDbModule.insertQuery(sql, parameters);
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new RuntimeException("SQL 오류: " + e.getMessage());
//        }
//
//        return res;
//    }
    public int insertMember(MemberDTO member) {
        String sql = "INSERT INTO FULLSTACK7.tbl_member (userId, name, pwd, ssn, addr1, addr2, birthday, jobCode) VALUES (?, ?, sha2(?,256), ?, ?, ?, ?, ?)";
        int res = 0;

        try (MySqlDbModule mySqlDbModule = new MySqlDbModule()) {

            String[] parameters = {
                    member.getUserId(),
                    member.getName(),
                    member.getPwd(),
                    member.getSsn(),
                    member.getAddr1(),
                    member.getAddr2(),
                    member.getBirthday(),
                    member.getJobCode()
            };

            res = mySqlDbModule.insertQuery(sql, parameters);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return res;
    }

    public int updateMember(MemberDTO member) {
        String sql = "UPDATE FULLSTACK7.tbl_member (userId, name, pwd, ssn, addr1, addr2, birthday, jobCode) VALUES (?, ?, sha2(?,256), ?, ?, ?, ?, ?)";
        int res = 0;

        try (MySqlDbModule mySqlDbModule = new MySqlDbModule()) {

            String[] parameters = {
                    member.getUserId(),
                    member.getName(),
                    member.getPwd(),
                    member.getSsn(),
                    member.getAddr1(),
                    member.getAddr2(),
                    member.getBirthday(),
                    member.getJobCode()
            };

            res = mySqlDbModule.insertQuery(sql, parameters);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return res;
    }

    //for로 돌리기
    public int deleteMember(String[] memberIdArray) {
        String sql = "DELETE FROM FULLSTACK7.tbl_member WHERE userId = ?";
        int res = 0;
        try (MySqlDbModule mySqlDbModule = new MySqlDbModule()) {
            for (int i = 0; i < memberIdArray.length; i++) {
                res = mySqlDbModule.deleteQuery(sql, new String[]{memberIdArray[i]});
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    // ? 동적쿼리
    public int deleteMemberWithIn(String[] memberIdArray) {
        StringBuilder placeholders = new StringBuilder();

        // ? 생성
        for (int i = 0; i < memberIdArray.length; i++) {
            placeholders.append("?");
            if (i < memberIdArray.length - 1) {
                placeholders.append(", ");
            }
        }

        String sql = "DELETE FROM FULLSTACK7.tbl_member WHERE userId IN (" + placeholders + ")";
        int res = 0;

        try (MySqlDbModule mySqlDbModule = new MySqlDbModule()) {
            res = mySqlDbModule.deleteQuery(sql, memberIdArray);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
}
