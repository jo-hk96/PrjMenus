package menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//Dao : Data Access Object
//CRUD 작업: Create(Insert) , Read(Select) ,Update(Update), Delete(Delete)
public class MenuDao {
	//데이터 추가
	public void addMenu(String menu_id, String menu_name , int menu_seq) {
		//DBConn의 클래스 호출	
		DBConn 		db  	    = new DBConn();
		Connection  conn 		= db.getConnection();
		String sql = "insert into menus values(?,?,?)";
		PreparedStatement pstmt = null;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menu_id);
			pstmt.setString(2, menu_name);
			pstmt.setInt(3, menu_seq);
			
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close(); 
				if(conn != null) conn.close(); 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	//데이터 조회(목록)
	public ArrayList<MenuDto> getMenulist() {
	DBConn db = new DBConn();
	Connection conn = db.getConnection();
	String sql ="select * from menus";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<MenuDto> menuList = new ArrayList<>();
	try {
		pstmt = conn.prepareStatement(sql);
		 rs = pstmt.executeQuery(); // 조회
		 while(rs.next()) {
			String menu_id   = rs.getString("menu_id");
			String menu_name = rs.getString("menu_name");
			int menu_seq     = rs.getInt("menu_seq");
			MenuDto menuDto  = new MenuDto();
			menuDto.setMenu_id(menu_id);
			menuDto.setMenu_name(menu_name);
			menuDto.setMenu_seq(menu_seq);
			menuList.add(menuDto);
		}

	}catch (SQLException e) {
		e.printStackTrace();
	}finally {
		try {
				if(rs != null) rs.close(); 
				if(pstmt != null) pstmt.close(); 
				if(conn != null) conn.close(); 
			}catch(SQLException e) {
			e.printStackTrace();	
		}	
	}
	return menuList;
}
	
	
	
	//데이터 조회(메뉴한개)
	public  MenuDto getMenusById(String menu_id) {
		DBConn db = new DBConn();
		Connection conn = db.getConnection();
		String sql = "select menu_id , menu_name , menu_seq from menus where menu_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MenuDto menuDto = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menu_id);
			rs = pstmt.executeQuery();
			
			//조회된 행이 있다면
			if(rs.next()) {
				menuDto = new MenuDto();
				menuDto.setMenu_id(rs.getString("menu_id"));
				menuDto.setMenu_name(rs.getString("menu_name"));
				menuDto.setMenu_seq(rs.getInt("menu_seq"));
			}
			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
		return menuDto;
				
}
				
	//데이터 수정
	public int  updateMenu(MenuDto menuDto) { //MenuDto menuDTO 매개변수 
		DBConn db = new DBConn();
		Connection conn = db.getConnection();
		String sql ="update menus set menu_name = ? , menu_seq = ? where menu_id = ?";
		PreparedStatement pstmt = null;
		int updateRows = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menuDto.getMenu_name()); // menuDto.getMenu_name() 호출
			pstmt.setInt(2, menuDto.getMenu_seq());
			pstmt.setString(3, menuDto.getMenu_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
		}try {
			if(pstmt != null) pstmt.close(); 
			if(conn != null) conn.close(); 
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return updateRows;
		}

	
	
	
	
	//데이터 삭제
		public String delmenu(String menu_id) {
			DBConn db = new DBConn();
			Connection conn = db.getConnection();
			String sql = "delete from menus where menu_id = ?";
			PreparedStatement pstmt = null;
			String delMenued = "";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,menu_id);	
				pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			
			}finally {
				if(pstmt != null) {
					try {
						pstmt.close();
					}catch(SQLException e) {
						e.printStackTrace();	
					}
			}
				
			if(conn != null) {
				try {
					pstmt.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
			return delMenued;
			
		
		}
		
}
	
	

