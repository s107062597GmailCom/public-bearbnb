package team.lazybear.bearbnb.data;

import java.util.List;

public class IndexRoomPage {

    private List<IndexRoomSummary> summaries;

    private Integer totalPages;

    public List<IndexRoomSummary> getSummaries() {
        return summaries;
    }

    public void setSummaries(List<IndexRoomSummary> summaries) {
        this.summaries = summaries;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

}
