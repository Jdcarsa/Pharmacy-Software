package Model;


public class Presentation {
    
    private String id;
    private String descriptionPresentation;
    private String statePresentation = "Active";

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public Presentation() {
    }

    public Presentation(String descriptionPresentation) {
        this.descriptionPresentation = descriptionPresentation;
    }

    public String getDescriptionPresentation() {
        return descriptionPresentation;
    }

    public void setDescriptionPresentation(String descriptionPresentation) {
        this.descriptionPresentation = descriptionPresentation;
    }

    public String getStatePresentation() {
        return statePresentation;
    }

    public void setStatePresentation(String statePresentation) {
        this.statePresentation = statePresentation;
    }
    
    
}
