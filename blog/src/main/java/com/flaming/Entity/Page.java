package com.flaming.Entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Page<T> implements Serializable {

    private static final long serialVersionUID = -3926548674308126462L;

    private int pageSize;
    private int currentPage;
    private int totalPage;
    private int totalData;
    private List<T> dataList;
    // data in view aspect
    private int indexSize;
    private List<Integer> indexList;
    private boolean leftForward;
    private boolean rightFoward;

    /** Default constructor **/
    public Page(){

    }

    /** Constructor with parameters **/
    public Page(int pageSize, int currentPage, int totalPage, int totalData, List<T> dataList, int indexSize, List<Integer> indexList,
                boolean leftForward, boolean rightFoward){
        this.pageSize = pageSize;
        this.currentPage = currentPage;
        this.totalPage = totalPage;
        this.totalData = totalData;
        this.dataList = dataList;
        this.indexSize = indexSize;
        this.indexList = indexList;
        this.leftForward = leftForward;
        this.rightFoward = rightFoward;
    }

    /**
     * Get the current data list.
     * @param pageNum the current page number.
     * @param pageSize the size of a page.
     * @param sourceList the source data list.
     * @param indexSize the size of index.
     */
    public Page(int pageNum, int pageSize, List<T> sourceList, int indexSize){
        // Judge safety.
        if(null == sourceList || sourceList.isEmpty()){
            return;
        }

        this.indexList = new ArrayList<Integer>();
        this.totalData = sourceList.size();
        this.pageSize = pageSize;
        this.totalPage = (totalData % pageSize != 0) ? totalData / this.pageSize + 1 : totalData / this.pageSize;
        currentPage = (pageNum > totalPage) ? totalPage : pageNum;

        // Get the data list.
        int fromPage = this.pageSize * (currentPage - 1);
        int toPage = (currentPage * this.pageSize > totalData) ? totalData : this.pageSize * currentPage;
        this.dataList = sourceList.subList(fromPage, toPage);

        // Get the index shown in view aspect.
        this.indexSize = indexSize;
        int fromIndex = 0;
        int toIndex = 0;
        if(totalPage <= indexSize){
            fromIndex = 1;
            toIndex = totalPage;
        } else{
            boolean rightEdge = totalPage - currentPage < indexSize;
            toIndex = rightEdge ? totalPage : currentPage + (indexSize - 1);
            fromIndex = rightEdge ? totalPage - (indexSize - 1) : currentPage;
        }
        leftForward = fromIndex > indexSize;
        rightFoward = toIndex < totalPage - (indexSize - 1);
        for(int i = fromIndex; i <= toIndex; i++){
            indexList.add(i);
        }
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalData() {
        return totalData;
    }

    public void setTotalData(int totalData) {
        this.totalData = totalData;
    }

    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }

    public int getIndexSize() {
        return indexSize;
    }

    public void setIndexSize(int indexSize) {
        this.indexSize = indexSize;
    }

    public List<Integer> getIndexList() {
        return indexList;
    }

    public void setIndexList(List<Integer> indexList) {
        this.indexList = indexList;
    }

    public boolean isLeftForward() {
        return leftForward;
    }

    public void setLeftForward(boolean leftForward) {
        this.leftForward = leftForward;
    }

    public boolean isRightFoward() {
        return rightFoward;
    }

    public void setRightFoward(boolean rightFoward) {
        this.rightFoward = rightFoward;
    }
}
