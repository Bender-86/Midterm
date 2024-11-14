classdef StudentDatabase
    properties
        Students % Adding an array of Students objects
    end
    
    methods
        % Applying the Constructor method
        function obj = StudentDatabase()
            obj.Students = [];
        end
        
        % Using method to save database to a .mat file
        function saveDatabase(obj, filename)
            save(filename, 'obj');
            fprintf('Database saved to %s\n', filename);
        end
        
        % Using method to load database from a .mat file
        function obj = loadDatabase(obj, filename)
            if exist(filename, 'file')
                loadedData = load(filename);
                obj = loadedData.obj;
                fprintf('Database loaded from %s\n', filename);
            else
                fprintf('Error: File not found\n');
            end
        end
        
        % Using method to add a new student
        function obj = addStudent(obj, Student_ID)
            obj.Students = [obj.Students, Student_ID]; % Append student to database
            fprintf('Student added: %s\n', Student_ID.Name);
        end
        
        % Using method to find a student by ID
        function student = findStudentByID(obj, Student_ID)
            student = [];
            for i = 1:length(obj.Students)
                if obj.Students(i).ID == Student_ID
                    student = obj.Students(i);
                    break;
                end
            end
            if isempty(student)
                fprintf('No student found with ID: %d\n', Student_ID);
            end
        end
        
        % Using method to get students by major
        function studentsByMajor = getStudentsByMajor(obj, Student_Major)
            studentsByMajor = [];
            for i = 1:length(obj.Students)
                if strcmp(obj.Students(i).Major, Student_Major)
                    studentsByMajor = [studentsByMajor, obj.Students(i)];
                end
            end
        end
    end
end
