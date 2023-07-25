package Model;


public class Presentation {
    
    private String descriptionPresentation;
    private String statePresentation = "Active";


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
