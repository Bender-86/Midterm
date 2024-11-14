% [Chris Bender]
% [bender86@students.rowan.edu]
% Course: MATLAB Programming - Fall 2024
% Assignment: Midterm 
% Date: [11-11-2024]

% creating class with required properties 

classdef StudentDB
    properties 
        Student_ID = ""
        Student_NAME = ""
        Student_AGE = ""
        Student_GPA = ""
        Student_MAJOR = ""
    end 


    % Using the Constructor Method 
    methods
        function res = create_student(currentObj, Student_ID, Student_NAME, Student_AGE, Student_GPA, Student_MAJOR)
            currentObj.Student_ID = Student_ID;
            currentObj.Student_NAME = Student_NAME;
            currentObj.Student_AGE = Student_AGE;
            currentObj.Student_GPA = Student_GPA;
            currentObj.Student_MAJOR = Student_MAJOR;

            res = currentObj;
        end
        function res = initStudent(currentObj)

        % asks for the students information
            currentObj.Student_ID = input("What's the ID of the Student", "s");
            currentObj.Student_NAME = input("What's the NAME of the Student", "s");
            currentObj.Student_AGE = input("What's the AGE of the Student", "s");
            currentObj.Student_GPA = input("What's the GPA of the Student", "s");
            currentObj.Student_MAJOR = input("What's the MAJOR of the Student", "s");

            res = currentOBJ;
        end

        % Displays the student information
        function res = showStudent(currentObj)
            fprintf("Student_ID: %s \n", currentObj.Student_ID)
            fprintf("Student_NAME: %s \n", currentObj.Student_NAME)
            fprintf("Student_AGE: %s \n", currentObj.Student_AGE)
            fprintf("Student_GPA: %s \n", currentObj.Student_GPA)
            fprintf("Student_MAJOR: %s \n", currentObj.Student_MAJOR)
            res = 1;
        end

         % Method to update GPA
        function obj = updateGPA(obj, newGPA)
            if newGPA >= 0 && newGPA <= 4.0
                obj.GPA = newGPA;
                fprintf('GPA updated to %.2f\n', obj.GPA);
            else
                fprintf('Invalid GPA value. GPA must be between 0 and 4.0\n');
        end
        function res = setStudent_NAME(currentObj, StudentName)
            currentObj.Student_NAME = StudentNAME;
            currentObj.showStudent()
            res = currentObj
        end
    end

end 

classdef StudentDatabase
    properties
        Students % Array of Student objects
    end
    
    methods
        % Constructor method
        function obj = StudentDatabase()
            obj.Students = [];
        end
        
        % Method to save database to a .mat file
        function saveDatabase(obj, filename)
            save(filename, 'obj');
            fprintf('Database saved to %s\n', filename);
        end
        
        % Method to load database from a .mat file
        function obj = loadDatabase(obj, filename)
            if exist(filename, 'file')
                loadedData = load(filename);
                obj = loadedData.obj;
                fprintf('Database loaded from %s\n', filename);
            else
                fprintf('Error: File not found\n');
            end
        end
        
        % Method to add a new student
        function obj = addStudent(obj, student)
            obj.Students = [obj.Students, student]; % Append student to database
            fprintf('Student added: %s\n', student.Name);
        end
        
        % Method to find a student by ID
        function student = findStudentByID(obj, studentID)
            student = [];
            for i = 1:length(obj.Students)
                if obj.Students(i).ID == studentID
                    student = obj.Students(i);
                    break;
                end
            end
            if isempty(student)
                fprintf('No student found with ID: %d\n', studentID);
            end
        end
        
        % Method to get students by major
        function studentsByMajor = getStudentsByMajor(obj, major)
            studentsByMajor = [];
            for i = 1:length(obj.Students)
                if strcmp(obj.Students(i).Major, major)
                    studentsByMajor = [studentsByMajor, obj.Students(i)];
                end
            end
        end
    end
end
