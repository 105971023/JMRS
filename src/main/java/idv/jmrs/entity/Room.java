package idv.jmrs.entity;
// Generated 2016/11/10 下午 04:40:44 by Hibernate Tools 5.2.0.Beta1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Room generated by hbm2java
 */
@Entity
@Table(name = "room")
public class Room implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer roomId;
	private Country country;
	private Region region;
	private String name;
	private String comment;
	private boolean status;
	private Set<Book> books = new HashSet<Book>(0);

	public Room() {
	}

	public Room(String name) {
		this.name = name;
	}

	@Id
	@GeneratedValue
	@Column(name = "room_id", unique = true, nullable = false)
	public Integer getRoomId() {
		return this.roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "country_id")
	public Country getCountry() {
		return this.country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "region_id")
	public Region getRegion() {
		return this.region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	@Column(name = "name", nullable = false, length = 200)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "comment", length = 300)
	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "room")
	public Set<Book> getBooks() {
		return this.books;
	}

	public void setBooks(Set<Book> books) {
		this.books = books;
	}

	@Column(name = "status")
	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
