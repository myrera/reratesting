package in.gov.rera.common.util;

import java.util.Comparator;

import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

public class ComparatorUtil implements Comparator<ProjectRegistrationModel> {
    @Override
    public int compare(ProjectRegistrationModel a, ProjectRegistrationModel b) {
        return a.getApplicationNo().compareToIgnoreCase(b.getApplicationNo());
    }
}
