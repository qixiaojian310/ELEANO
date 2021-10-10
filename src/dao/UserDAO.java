package dao;

import vo.User;

public interface UserDAO {
    public int queryByUserID(User user) throws Exception;
    public int SignUpUser(User user) throws Exception;
    public User ReturnUser(String userID);
    public void ChangeUser(String userid,String password,String phone,String email,String nickname);
    public boolean ValidateID(String UserID);
}
