public class MBMS_Utilities {
    public static String getObjectName(Id recordId) {          
        Schema.sObjectType entityType = recordId.getSObjectType();
        
        String entityName = String.valueOf(entityType);
        
        if (!entityName.contains(MBMS_Constants.MBMS_NAMESPACE_PREFIX) && !entityName.contains(MBMS_Constants.MBMS_CUSTOM_OBJECT_SUFFIX)) {
            return entityName;
        }
        
        entityName = entityName.remove(MBMS_Constants.MBMS_NAMESPACE_PREFIX);
        entityName = entityName.remove(MBMS_Constants.MBMS_CUSTOM_OBJECT_SUFFIX);
        
        if (entityName.contains('_')) {
            entityName = entityName.replace('_', ' ');
        }
        
        return entityName;
    }
    
    public static Integer getRandomNumber(Integer max) {
        return Integer.valueof((Math.random() * max));
    }
    
    public static Integer getRandomNumber(Integer min, Integer max) {
        return Integer.valueof((Math.random() * max) + min);
    }
    
    public static Date getRandomPastDate(Integer yearsMin, Integer yearsMax, Integer months, Integer days) {
        return Date.today()
            .addYears(-getRandomNumber(yearsMin, yearsMax))
            .addDays(getRandomNumber(months))
            .addMonths(getRandomNumber(days));
    }
}