public class Utilities {
    public static String getObjectName(Id recordId) {          
        Schema.sObjectType entityType = recordId.getSObjectType();
        
        String entityName = String.valueOf(entityType);
        
        if (!entityName.contains(Constants.NAMESPACE_PREFIX) && !entityName.contains(Constants.CUSTOM_OBJECT_SUFFIX)) {
            return entityName;
        }
        
        entityName = entityName.remove(Constants.NAMESPACE_PREFIX);
        entityName = entityName.remove(Constants.CUSTOM_OBJECT_SUFFIX);
        
        if (entityName.contains('_')) {
            entityName = entityName.replace('_', ' ');
        }
        
        return entityName;
    }
    
    // Returns number >= 0 and <= max.
    public static Integer getRandomNumber(Integer max) {
        return getRandomNumber(0, max);
    }
    
    // Returns number >= min and <= max.
    public static Integer getRandomNumber(Integer min, Integer max) {
        return Integer.valueof((Math.random() * (max - min + 1) + min));
    }
    
    public static Date getRandomPastDate(Integer yearsMin, Integer yearsMax, Integer months, Integer days) {
        return Date.today()
            .addYears(-getRandomNumber(yearsMin, yearsMax))
            .addDays(getRandomNumber(months))
            .addMonths(getRandomNumber(days));
    }
}