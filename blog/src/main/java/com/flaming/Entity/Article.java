package com.flaming.Entity;


import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Entity class of Article
 * @author flaming
 *
 */
@Entity
@Table(name = "Article")
public class Article implements Serializable, Comparable<Article>{

    private static final long serialVersionUID = 668549858921792160L;

    private String id;
    private String title;
    private String picUrl;
    private Date publish;
    private String mdContent;
    private String introduction;
    private int total_click;
    private Set<Category> categories = new HashSet<Category>();
    private int sortIndex;
    private String block;

    /** Default constructor **/
    public Article(){
        this.id = null;
        this.title = null;
        this.picUrl = null;
        this.publish = null;
        this.mdContent = null;
        this.introduction = null;
        this.total_click = 0;
        this.categories = null;
        this.block = null;
    }

    /** Constructor with parameters **/
    public Article(String title, String picUrl, Date publish, String mdContent, String introduction,
                   int total_click, Set<Category> categories, int sortIndex, String block){
        this.title = title;
        this.picUrl = picUrl;
        this.publish = publish;
        this.mdContent = mdContent;
        this.introduction = introduction;
        this.total_click = total_click;
        this.categories = categories;
        this.sortIndex = sortIndex;
        this.block = block;
    }

    /** Constructor with parameters **/
    public Article(String id, String title, String picUrl, Date publish, String mdContent, String introduction,
                   int total_click, Set<Category> categories, int sortIndex, String block){
        this.id = id;
        this.title = title;
        this.picUrl = picUrl;
        this.publish = publish;
        this.mdContent = mdContent;
        this.introduction = introduction;
        this.total_click = total_click;
        this.categories = categories;
        this.sortIndex = sortIndex;
        this.block = block;
    }

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @Column(name = "id", nullable = false, unique = true, length = 32)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    @Column(name = "title", nullable = false)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    @Column(name = "picUrl", nullable = false)
    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }
    @Column(name = "publish", nullable = false)
    public Date getPublish() {
        return publish;
    }

    public void setPublish(Date publish) {
        this.publish = publish;
    }
    @Column(name = "mdContent", nullable = true, columnDefinition = "text")
    public String getMdContent(){
        return mdContent;
    }

    public void setMdContent(String mdContent){
        this.mdContent = mdContent;
    }

    @Column(name = "introduction", nullable = true)
    public String getIntroduction(){
        return introduction;
    }

    public void setIntroduction(String introduction){
        this.introduction = introduction;
    }

    @Column(name = "total_click", nullable = false)
    public int getTotal_click() {
        return total_click;
    }

    public void setTotal_click(int total_click) {
        this.total_click = total_click;
    }
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "article_category",
                joinColumns = { @JoinColumn(name = "articleId") },
                inverseJoinColumns = { @JoinColumn(name = "categoryId") })
    public Set<Category> getCategories(){
        return this.categories;
    }

    public void setCategories(Set<Category> categories){
        this.categories = categories;
    }
    @Column(name = "sortIndex", nullable = false)
    public int getSortIndex(){
        return sortIndex;
    }

    public void setSortIndex(int sortIndex){
        this.sortIndex = sortIndex;
    }
    @Column(name = "block", nullable = false)
    public String getBlock(){
        return this.block;
    }

    public void setBlock(String block){
        this.block = block;
    }


    public int compareTo(Article o){
        if (o.getPublish().after(this.publish)){
            return 1;
        } else{
            return -1;
        }
    }
}
