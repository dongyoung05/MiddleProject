package kr.or.ddit.vo;

public class BoardVO {
	
	private String board_no;
	private String board_title;
	private String board_content;
	private String board_date;
	private String board_img;
	private String board_delyn;
	private int review_score;
	private String mem_id;
	private String order_no;
	private String board_ctgry_no;
	private int board_views;
	
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getBoard_img() {
		return board_img;
	}
	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}
	public String getBoard_delyn() {
		return board_delyn;
	}
	public void setBoard_delyn(String board_delyn) {
		this.board_delyn = board_delyn;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getBoard_ctgry_no() {
		return board_ctgry_no;
	}
	public void setBoard_ctgry_no(String board_ctgry_no) {
		this.board_ctgry_no = board_ctgry_no;
	}
	public int getBoard_views() {
		return board_views;
	}
	public void setBoard_views_score(int board_views) {
		this.review_score = board_views;
	}
	@Override
	public String toString() {
		return "BoardVO [board_no=" + board_no + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_date=" + board_date + ", board_img=" + board_img + ", board_delyn=" + board_delyn
				+ ", review_score=" + review_score + ", mem_id=" + mem_id + ", order_no=" + order_no
				+ ", board_ctgry_no=" + board_ctgry_no + ", board_views=" + board_views + "]";
	}
	
	

}
