public class RemovalBatchScheduler implements Schedulable {
    public void execute(SchedulableContext ctx) {
        Database.executeBatch(new ArtistsRemovalBatch());
        Database.executeBatch(new MoviesRemovalBatch());
        Database.executeBatch(new BatchLogsRemovalBatch());
    }
}