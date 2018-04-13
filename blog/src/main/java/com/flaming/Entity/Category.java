package com.flaming.Entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

@Entity
@Table(name = "Category")
public class Category implements Serializable{

    private static final long serialVersionUID = 6641573275784817651L;

    private String id;
    private String content;
    private Set<Article> articles = new TreeSet<Article>();

    /** Default constructor **/
    public Category(){
        this.id = null;
        this.content = null;
        this.articles = null;
    }

    /** Constructor with parameters **/
    public Category(String content){
        this.content = content;
    }

    /** Constructor with parameters **/
    public Category(String content, Set<Article> articles){
        this.content = content;
        this.articles = articles;
    }

    /** Constructor with parameters **/
    public Category(String id, String content, Set<Article> articles){
        this.id = id;
        this.content = content;
        this.articles = articles;
    }

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid")
    @Column(name = "id", nullable = false, unique = true, length = 32)
    public String getId(){
        return this.id;
    }

    public void setId(String id){
        this.id = id;
    }
    @Column(name = "content", nullable = false, unique = true)
    public String getContent(){
        return this.content;
    }

    public void setContent(String content){
        this.content = content;
    }
    @ManyToMany(mappedBy = "categories")
    public Set<Article> getArticles(){
        return this.articles;
    }

    public void setArticles(Set<Article> articles){
        this.articles = new TreeSet<Article>(articles);
    }

    @Override
    public String toString(){
        return content + "(" + articles.size() + ")";
    }
}
