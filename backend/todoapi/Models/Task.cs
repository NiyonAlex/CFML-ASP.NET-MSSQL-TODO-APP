namespace TodoApi.Models;
public class Task
{
    public int TaskId { get; set; }
    public string TaskDescription { get; set; }
    public bool IsCompleted { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
}
