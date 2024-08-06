package kr.or.ddit.vo;

public class ProdVO {
	private String prod_no;
	private String prod_name;
	private String prod_desc;
	private String prod_size;
	private String prod_color;
	private String prod_img;
	private int prod_price;
	private String prod_delyn;
	private String prod_date;
	private String prod_ctgry_id;
	private String prod_ctgry_name;
	private String prod_weight;
	
	public String getProd_no() {
		return prod_no;
	}
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getProd_desc() {
		return prod_desc;
	}
	public void setProd_desc(String prod_desc) {
		this.prod_desc = prod_desc;
	}
	public String getProd_size() {
		return prod_size;
	}
	public void setProd_size(String prod_size) {
		this.prod_size = prod_size;
	}
	public String getProd_color() {
		return prod_color;
	}
	public void setProd_color(String prod_color) {
		this.prod_color = prod_color;
	}
	public String getProd_img() {
		return prod_img;
	}
	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_delyn() {
		return prod_delyn;
	}
	public void setProd_delyn(String prod_delyn) {
		this.prod_delyn = prod_delyn;
	}
	public String getProd_date() {
		return prod_date;
	}
	public void setProd_date(String prod_date) {
		this.prod_date = prod_date;
	}
	public String getProd_ctgry_id() {
		return prod_ctgry_id;
	}
	public void setProd_ctgry_id(String prod_ctgry_id) {
		this.prod_ctgry_id = prod_ctgry_id;
	}
	public String getProd_ctgry_name() {
		return prod_ctgry_name;
	}
	public void setProd_ctgry_name(String prod_ctgry_name) {
		this.prod_ctgry_name = prod_ctgry_name;
	}
	public String getProd_weight() {
		return prod_weight;
	}
	public void setProd_weight(String prod_weight) {
		this.prod_weight = prod_weight;
	}
	
	@Override
	public String toString() {
		return "ProdVO [prod_no=" + prod_no + ", prod_name=" + prod_name + ", prod_desc=" + prod_desc + ", prod_size="
				+ prod_size + ", prod_color=" + prod_color + ", prod_img=" + prod_img + ", prod_price=" + prod_price
				+ ", prod_delyn=" + prod_delyn + ", prod_date=" + prod_date + ", prod_ctgry_id=" + prod_ctgry_id
				+ ", prod_ctgry_name=" + prod_ctgry_name + ", prod_weight=" + prod_weight + "]";
	}
}
