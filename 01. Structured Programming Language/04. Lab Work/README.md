# C Programming Lab
Implementation using C in programming lab class when being Teacher Assistant.  
The problems are [here](http://134.208.3.66/problems?keyword=PR&page=1)  
  
## Problems and Description
* [Week2](Week2)
    * [week2-1](Week2/week2-1.c)
        * Description: A man walks X km in Y hours  in the same direction. What is the man's velocity in km/h for the journey?
        * Input: Input contain two number in a line and separate by a single space, first number stand for distance in km, second number stand for time in hour.
        * Output: A number stand for velocity in km/h, please rounded to six decimal places.
    * [week2-2](Week2/week2-2.c)
        * Description: Read a 4 digit number, reverse it and display it.
        * Input: A 4 digit number, first digit is not 0.
        * Output: A 4 digit number after reverse.
    * [week2-3](Week2/week2-3.c)
        * Description: Read in a number, round it down to an integer and display on screen.
        * Input: A number.
        * Output: Display the integer after round down.
    * [week2-4](Week2/week2-4.c)
        * Description: Please write a program allow user input two integer and print out the result of addition subtraction multiplication  division and modulo of two integer.
        * Input: Two integer separate by a single space.
        * Output: See sample output.
    * [week2-5](Week2/week2-5.c)
        * Description: Please write a program allow user input two floating point number and print out the result of addition, subtraction, multiplicationanddivision of two number.
        * Input: Two floating point number separate by a single space
        * Output: See sample output
    * [week2-6](Week2/week2-6.c)
        * Description: Gave you a number n, please find the maximum even number less than or equal to n.
        * Input: An positive integer n.
        * Output: An largest even number less than or equal to n.
* [Week3](Week3)
    * [week3-1](Week3/week3-1.c)
        * Description: Please input an integer, determine if the integer is odd or even.
        * Input: Just an integer.
        * Output: output "odd" if the integer is odd, "even" if the integer is even.
    * [week3-2](Week3/week3-2.c)
        * Description: Read in two integer m and n, determine if m is multiple of n.
        * Input: Input will be two integer m and n separate by a single space.
        * Output: Please reference the sample out
    * [week3-3](Week3/week3-3.c)
        * Description: We use two points to present a segment in one dimensional coordinates. Give you two segment, your job is to determine two segment are overlay or not.
        * Input: Input consist 4 integer, first two present segment 1, and follow two present segment 2.
        * Output: Print "overlay" if two segment overlay, "no overlay" if not.
    * [week3-4](Week3/week3-4.c)
        * Description: Three segment length a, b, c, c has maximum length, if a + b > c than these three segment can construct a triangle. If a * a + b * b = c * c it will be a "right triangle", if a * a + b * b > c * c it will be a "acute triangle", if a * a + b * b < c * c it will be a "obtuse triangle". Write a program to determine what kind of triangle it will be.
        * Input: Input consist three integer a, b, c, c will be the maximum value.
* [Week4](Week4)
    * [week4-1](Week4/week4-1.c)
        * Description: Please write a program that can keep read in integer until 0, sum up all integer and print out the result.
        * Input: Input consist several integer until 0.
        * Output: sum of all integer.
    * [week4-2](Week4/week4-2.c)
        * Description: Please write a program read in an integer and print out all its factor.
        * Input: Input consist an positive integer.
        * Output: Print out all factors incremental ordering.
    * [week4-3](Week4/week4-3.c)
        * Description: Please write a program to determine if a number is prime or not.
        * Input: Input consist several test case. Every test case is just a integer. Input ended with 0.
        * Output: For every test case output "prime" if the input is a prime number, output "not a prime" if not.
    * [week4-4](Week4/week4-4.c)
        * Description: Please write a program, input a positive integer to represent the number of regular triangle layers, and print this triangle.
        * Input: A[1, 30] positive integer.
        * Output: Print this regular triangle.
    * [week4-5](Week4/week4-5.c)
        * Description: Please write a program for prime factorization.
        * Input: Input consist several test case. Every test case is just a integer. Input ended with 0.
        * Output: Please reference the sample output.
    * [week4-6](Week4/week4-6.c)
        * Description: Morse code is a character encoding scheme used in telecommunication that encodes text characters as standardized sequences of two different signal durations called dots and dashes or dits and dahs. Morse code is named for Samuel F. B. Morse, an inventor of the telegraph. Write a program allow user input a number and print out corresponding Morse code.
        * Input: Input is an integer number.
        * Output: Print out the corresponding Morse code.
    * [week4-7](Week4/week4-7.c)
        * Description: Given the square root of a positive integer N is between 0 and N, let the square root of N be x, a=0 is the lower bound, and b=N is the upper bound. Then there is the inequality a<=x<=b, square the inequality to get a*a<=x*x=N<=b*b, and let c = (a+b)/2 according to the root approximation through bisection, when square of c is greater than or equal to N, we update the upper bound and get a new inequality a<=x<=c, otherwise, we update the lower bound and get a new inequality c<=x<=b. The difference between the upper and lower bounds is called the error. Please design a program in which the user enters a positive integer and calculates the square root of the positive integer. Please be accurate to four decimal places.
        * Input: An integer n.
        * Output: Output the root of naccurate to four decimal places.
* [Week5](Week5)
    * [week5-1](Week5/week5-1.c)
        * Description: Please write a program to find the maximum and minimum number.
        * Input: Input consist multiple integer separate by a space.
        * Output: Output maximum number first and than minimum, separate them using a single space.
    * [week5-2](Week5/week5-2.c)
        * Description: Please write a program to find the greatest common divisor of  three number.
        * Input: Input consist several test case, each test case a line. For every test case there are three non-negative integer in it and separate by a space.
        * Output: For each test case output the result in one line.
    * [week5-3](Week5/week5-3.c)
        * Description: A mathmatician Goldbach's conjecture: any even number(larger than 2) can divide into two prime number’s sum.But some even numbers can divide into many pairs of two prime numbers’ sum. Example:10 =3+7, 10=5+5, 10 can divide into two pairs of two prime number.
        * Input: Input consist a positive even number n(4<=n<=32766).
        * Output: Print the value of how many pairs are this even number can be divided into.
    * [week5-4](Week5/week5-4.c)
        * Description: There is snail climbing on the wall from bottom, wall is 10 meter height. every day the snail climb up 4 meter, and slide down 3 meter at the night. In day 7 the snail climb up to the top of the wall. Please write a program, read in height of the wall, how many meter the snail climb up a day, how many meter the snail slide down at night, give the answer of which day the snail climb up to the top of the wall.
        * Input: Input consist three integer, first is height of the wall, second is meter of snail climb up a day, third is meter the snail slide down at night.
        * Output: Out a number represent in which day the snail will climb to top of the wall. Output -1 if the snail can never climb up the top.
* [Week6](Week6)
    * [week6-1](Week6/week6-1.c)
        * Description: A truncated mean or trimmed mean is a statistical measure of central tendency, much like the mean and median. It involves the calculation of the mean after discarding given parts of a probability distribution or sample at the high and low end, and typically discarding an equal amount of both. This number of points to be discarded is usually given as a percentage of the total number of points, but may also be given as a fixed number of points.Write a program calculate trimmed mean with discarding 3 number from high and low.
        * Input: Input start with a integer N(N > 6) represent the number of sample, fellow by N integer represent the sample.
        * Output: Output trimmed mean round down to second decimal place
    * [week6-2](Week6/week6-2.c)
        * Description: Giving 10 number, output them in ascending order.
        * Input: Input consist 10 integer, each of them separate by a single space.
        * Output: output the 10 number inascending order.
    * [week6-3](Week6/week6-3.c)
        * Description: Write a program to determine if a string is apalindrome or not.
        * Input: Input string will include only letter,please consider uppercase and lowercase as the same.
        * Output: Please refer to the sample output.
    * [week6-4](Week6/week6-4.c)
        * Description: An electoral system is a set of rules that determine how elections and referendums are conducted and how their results are determined. For a single-winner election, we have two different electoral systems, please write a program to detect which candidate wins the election.:
            * majoritarian system: candidate have to receive a majority (more than half) of the votes to be elected. 
            * plurality system: candidate with the highest number of votes wins, with no requirement to get a majority of votes. 
        * Input: Input file consists several test cases.Each test case consists 2 lines of data. First line is 2 integers n and m, shows the number of candidates and the number of votes. Second line consists m integers, shows the votes. Candidates are numbered by integers [1, n]. 1 < n < 200. 1 <= m <= 1000000. n = m = 0 shows end of test cases.
        * Output: Output of each test case occupy one line.If there are no single-winner, output "No winner". If the winner may win a majoritarian election, output "Majoritarian winner" and the winner. If the winner can only win a plurality election, output "Plurality winner" and the winner.
    * [week6-5](Week6/week6-5.c)
        * Description: During their honeymoon, Mrs and Mr Smith went to the Himalayas. How they were surprised when they observed that, during the sunset, all the snow touched by the sunbeams turned red.Such a magnificent landscape leaves everyone plenty of emotion, but Mr Smith’s number obsession overcame all this. He rapidly began evaluating distances, which made Mrs Smith quite upset.Your work is to help him calculate the size, in meters, of the mountainsides that became red as the sun sets. Mr Smith’s honeymoon depends on you! Please be quick and efficient.For the sake of simplicity, consider that, during the sunset, the sunbeams are horizontal and assume that the landscape is described by the set of coordinates of the mountain peaks and cols. This can be depicted by the following figure. A landscape, in this context, is then a sequence of peaks and cols (i.e.,only a col follows a peak and conversely). Note that, in this picture, the sunny mountainsides are emphasized by bold lines and the coordinates of the landscape are emphasized by bold points.Thus, the goal of this problem is to calculate the total length in meters of the bold lines.For this task consider that: (1) for all coordinates (x, y), 0 ≤ x ≤ 30000 and 0 ≤ y ≤ 8848; (2)the unit is the meter; (3) all the X-coordinates are pair-wise distinct; (4) the leftmost point has 0 as X-coordinate and the rightmost point has 0 as Y-coordinate; (5) The total number of coordinates given is n ≤ 100.
        * Input: The first line of input contains C (0 < C < 100), the number of test cases that follows.Each test case starts with a line containing the number N of coordinate pairs. The remaining N lines for each test case contain the coordinates defining the landscape. Each of these lines contains two integers, x and y, separated by a single space. The first integer, x, is the X-coordinate, and the second,y, is the Y-coordinate of the considered point.
        * Output: The output is formed by a sequence of lines, one for each test case. Each line contains a single realnumber with exactly two decimal digits. This number represents the length in meters of the sunnymountainsides for the corresponding test case.
* [Week8](Week8)
    * [week8-1](Week8/week8-1.c)
        * Description: A sparse matrix is a matrix in which most of the elements are zero. Representing a sparse matrix by a 2D array leads to wastage of lots of memory as zeroes in the matrix are of no use in most of the cases. So, we can compress the sparse matrix by only store non-zero elements. This means storing non-zero elements with triples- (Row, Column, value).
        * Input: First line consists 3 integers. First and second integers shows the dimensions of original matrix. Third integer k shows number of non-zero elements. Followed k lines are content of the sparse matrix. Each line consists 3 integers, row number, column number, and data.
        * Output: Output original matrix. Attach a white space behind each element.
    * [week8-2](Week8/week8-2.c)
        * Description: Give you a 2-D array represent a maze, in this maze, 1 is wall and 0 is a space you can walk on. You can move 4 direction, up, down, left and right. Write a program to see if a maze has a way from start to the end.
        * Input: First lint pf input will be a integer number represent size of the maze.Follow by n rows and n columns every row. In the maze, left top is the start and right button is end.
        * Output: if there is a way from start to the end then print "Yes", print "No" if not.
    * [week8-3](Week8/week8-3.c)
        * Description: Give you a matrix. Please output the elements in clockwise spiral order.
        * Input: First line is two integers m and n, shows number of rows and number of columns. Followed m lines are content of the matrix.
        * Output: Elements of the matrix in clockwise spiral order.
    * [week8-4](Week8/week8-4.c)
        * Description: You have 2 tables,coursesandscores.coursesconsists 3 columns,sid,student_id, andcourse_id.scoresconsists 2 columns,sidandscore. Please find that how many students failed on at least one course.
        * Input: First line consists 2 integers m and n, shows number of rows incoursesandscores. Followed m lines are records ofcourses.student_idare 8-digits numbers begin with non-zero digit.sidandscoresare positive integers smaller than 1000. Followed n lines are records ofscores.sidare positive integers smaller than 1000.scoreare integers in range [0, 100].
        * Output: Student will be flunked when his/her average score in the course less than 60. Output is 2 integers shows number of student and student failed on at lease one course.
* [Week9](Week9)
    * [week9-1](Week9/week9-1.c)
        * Description: Finish the following function. The function compare two number a and b, return 1 if a > b, return -1 if a < b, return 0 if a = b.
    * [week9-2](Week9/week9-2.c)
        * Description: Finish the following function. The function swap two number a and b.
    * [week9-3](Week9/week9-3.c)
        * Description: Finish the following function. The function sort the first n element in array inascending order.
* [Week10](Week10)
    * [week10-1](Week10/week10-1.c)
        * Description: Please finish function elementAt. There are two parameter  in elementAt, a pointer point to an integer and a integer n(n > 0). Function elementAt return the nth integer after the pointer.
    * [week10-2](Week10/week10-2.c)
        * Description: Please finish function between. Function between have two parameter a and b which are both the pointer point to integer. Function between return the summation of all integer after pointer a and before pointer b.
    * [week10-3](Week10/week10-3.c)
        * Description: Please finish function merger. There are three parameter in function merger, a, b and c, all of them are pointer point to integer. Function merger will take five integer after pointer a and five integer after pointer b and puts them after pointer c by increasing order.

