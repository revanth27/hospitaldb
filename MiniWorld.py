import subprocess as sp
import pymysql
import pymysql.cursors
import decimal
import re

def check(data, lent):
    if len(data) > lent:
        raise ValueError("Given data exceeds the range or length.")

    return

def checks(blood_group):
    if blood_group=='O+' or blood_group=='O-' or blood_group=='A+' or blood_group=='A-' or blood_group=='B+' or blood_group=='B-' or blood_group=='AB-' or blood_group=='AB+' or blood_group=='':
        return
    else:
        raise ValueError("Given data isnt allowed.")

def checkb(data):
    if data == 'I' or data == 'O':
        return
    else:
        raise ValueError("Given data exceeds the range or length.")


def option2():
    """
    Function to implement option 1
    """
    try:

        query = "SELECT PATIENT.first_name, PATIENT.last_name, PATIENT.middle_name FROM PATIENT INNER JOIN IN_PATIENT_FUNC ON PATIENT.p_id = IN_PATIENT_FUNC.p_id WHERE discharge_date = %s"
        
        rdate = input("Discharge date: ")
 
        adr = (rdate, )
        
        print(query, adr)
        cur.execute(query, adr)
        record = cur.fetchall()
  
        for row in record:
            print(row)
        
        con.commit()

        #print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to extract names from database.")
        print(">", e)
        print('Got error {!r}, errno is {}'.format(e, e.args[0]))

    return


def option8():
    """
    Function to implement option 1
    """
    try:
        # Takes emplyee details as input

        ins = input("To update 'medicine' table type 'y' else 'n': ")
        if ins == 'n':
            return
        elif ins != 'y':
            raise ValueError ("Input should be either 'y' or 'n'")

        id = (input("Medicine id: "))
        check(id, 9)
        id = int(id)
        cos = int(input("Medicine cost: "))
        
        query = "UPDATE MEDICINE SET cost = %d WHERE id = %d" % (cos, id)
        print(query)
        cur.execute(query)
        
        query = "UPDATE PRESCRIBE_FUNC_2 SET medicine_cost = %d WHERE id = %d" % (cos, id)
        print(query)
        cur.execute(query)

        ins = input("To update 'test' table type 'y' else 'n': ")
        if ins == 'n':
            return
        elif ins != 'y':
            raise ValueError ("Input should be either 'y' or 'n'")
        
        id = input("Room type: ")
        check(id, 9)
        cos = int(input("Room cost: "))
        query = "UPDATE ROOM_FUNC SET room_cost = %d WHERE room_type = '%s'" % (cos, id)
        print(query)
        cur.execute(query)
        
        con.commit()

        #print("Inserted Into Database")

    except ValueError as ve:
        con.rollback()
        print(">", ve)
    
    except Exception as e:
        con.rollback()
        print("Failed to update the database")
        print(">", e)

    return



def option4():
    """
    Function to implement option 1
    """
    try:
        # Takes emplyee details as input

        text = input("text: ")
        
        query = "SELECT medicine_name FROM MEDICINE WHERE medicine_name LIKE '%%%s%%'" % text
        print(query)
        cur.execute(query)
        record = cur.fetchall()
        print("Medicine name: ", end = " ")
        for row in record:
            id = row["medicine_name"]
            print("(%s)"%id, end = " ")
        print("\n")

        query = "SELECT id FROM MEDICINE WHERE id LIKE '%%%s%%'" % text
        print(query)
        cur.execute(query)
        record = cur.fetchall()
        print("Medicine id: ", end = " ")
        for row in record:
            id = row["id"]
            print("(%s)"%id, end = " ")
        print("\n")

        query = "SELECT cost FROM MEDICINE WHERE cost LIKE '%%%s%%'" % text
        print(query)
        cur.execute(query)
        record = cur.fetchall()
        print("Medicine cost: ", end = " ")
        for row in record:
            id = row["cost"]
            print("(%s)"%id, end = " ")
        print("\n")

        query = "SELECT quantity FROM MEDICINE WHERE quantity LIKE '%%%s%%'" % text
        print(query)
        cur.execute(query)
        record = cur.fetchall()
        print("Medicine quantity: ", end = " ")
        for row in record:
            id = row["quantity"]
            print("(%s)"%id, end = " ")
        print("\n")

        query = "SELECT expiry_date FROM MEDICINE WHERE expiry_date LIKE '%%%s%%'" % text
        print(query)
        cur.execute(query)
        record = cur.fetchall()
        print("Medicine expiry date: ", end = " ")
        for row in record:
            id = row["expiry_date"]
            print("(%s)"%id, end = " ")
        print("\n")

        
        con.commit()

        #print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from the database")
        print(">", e)

    return


def option9():
    """
    Function to implement option 1
    """
    try:
        # Takes emplyee details as input

        id = (input("Driver id: "))
        check(id, 9)
        id = int(id)
        
        query = "SELECT COUNT(e_id) AS count FROM DRIVER WHERE e_id = %d" % (id)
        #print(query)
        cur.execute(query)
        record = cur.fetchone()
        
        if record["count"] == 1:
            
            query = "DELETE FROM DRIVER_FUNC WHERE e_id = %d" % (id)
            #print(query)
            cur.execute(query)

            query = "DELETE FROM DRIVER WHERE e_id = %d" % (id)
            #print(query)
            cur.execute(query)

            query = "DELETE FROM EMPLOYEE_FUNC WHERE e_id = %d" % (id)
            #print(query)
            cur.execute(query)
            
            query = "DELETE FROM EMPLOYEE WHERE e_id = %d" % (id)
            #print(query)
            cur.execute(query)

            print("Deleted the records of driver with given id successfully.")
        
        else:
            print("No such driver is present with given id.")
        
        con.commit()
        #print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database.")
        print(">", e)

    return

def option3():
    """
    Function to implement option 2
    """
    try:
        # Takes emplyee details as input

        query = "SELECT room_number, COUNT(room_number) AS sum FROM IN_PATIENT GROUP BY room_number"
        
        print(query)
        cur.execute(query)
        record = cur.fetchall()
        required = 0
        
        for row in record:
            id = str(row["room_number"])
            val = row["sum"]
            query = "SELECT * FROM ROOM WHERE room_number = %s"
            adr = (id, )
            print(query, id)
            cur.execute(query, adr)
            record = cur.fetchone()
            id = record["room_type"]
            query = "SELECT * FROM ROOM_FUNC WHERE room_type = %s"
            adr = (id, )
            print(query, id)
            cur.execute(query, adr)
            record = cur.fetchone()
            flow = record["room_cost"]
            required += flow * val
        
        query = "SELECT test_id, COUNT(test_id) AS sum FROM PRESCRIBE_FUNC_1 GROUP BY test_id"
        
        print(query)
        cur.execute(query)
        record = cur.fetchall()
        
        for row in record:
            id = str(row["test_id"])
            val = row["sum"]
            query = "SELECT * FROM TEST WHERE test_id = %s"
            adr = (id, )
            print(query, id)
            cur.execute(query, adr)
            record = cur.fetchone()
            flow = record["test_cost"]
            required += flow * decimal.Decimal(val)
        
        query = "SELECT * FROM PRESCRIBE_FUNC_2"
        print(query)
        cur.execute(query)
        record = cur.fetchall()
        
        for row in record:
            print(row)
            id = str(row["id"])
            val = row["medicine_count"]
            query = "SELECT * FROM MEDICINE WHERE id = %s"
            adr = (id, )
            print(query, id)
            cur.execute(query, adr)
            record = cur.fetchone()
            flow = record["cost"]
            required += flow * decimal.Decimal(val)

        print(required)
        con.commit()

        #print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to calculate sum")
        print(">", e)

    return


def option7():
    """
    Function to implement option 3
    """
    try:
        # Takes emplyee details as input
        row = {}
        row["Ssn"] = (input("SSN: "))
        check(row["Ssn"], 9)
        row["Ssn"] = int(row["Ssn"])
        row["Bgroup"] = input("Blood group: ")
        check(row["Bgroup"], 2)
        checks(row["Bgroup"])
        row["Sex"] = input("Sex: ")
        check(row["Sex"], 1)
        row["Bdate"] = input("Birth Date (YYYY-MM-DD): ")
        row["Adate"] = input("Arrival Date (YYYY-MM-DD): ")
        row["Fname"] = input("Fname: ")
        check(row["Fname"], 8)
        row["Lname"] = input("Lname: ")
        check(row["Lname"], 8)
        row["Minit"] = input("Minit: ")
        check(row["Minit"], 1)
        row["Dno"] = input("Dno: ")
        check(row["Dno"], 10)
        row["Street"] = input("Street: ")
        check(row["Street"], 7)
        row["Town"] = input("Town: ")
        check(row["Town"], 7)
        row["State"] = input("State: ")
        check(row["State"], 10)
        row["subclass"] = input("If in patient type 'I' else 'O': ")
        check(row["subclass"], 1)
        checkb(row["subclass"])
 
        query = "INSERT INTO PATIENT VALUES('%d', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')" % (row["Ssn"], row["Bgroup"], row["Sex"], row["Bdate"], row["Adate"], row["Fname"], row["Lname"], row["Minit"], row["Dno"], row["Street"], row["Town"], row["State"], row["subclass"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">", e)
        print('Got error {!r}, errno is {}'.format(e, e.args[0]))

    return


def option6():

    try:
        dis = input("Disease: ")
        sql = "SELECT \
            IN_PATIENT.room_number AS room \
            FROM IN_PATIENT \
            INNER JOIN IN_PATIENT_FUNC_1 ON IN_PATIENT.p_id = IN_PATIENT_FUNC_1.p_id \
            WHERE IN_PATIENT_FUNC_1.mild_disease = '%s' \
            GROUP BY room" % dis

        #print(sql)
        cur.execute(sql)
        record = cur.fetchall()
        result = 0

        for row in record:
            print(row)
            result += 1

        print(result)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to calculate number of rooms")
        print(">", e)

    return


def option5():

    try:
        
        query = "CREATE TEMPORARY TABLE TEMP(e_id int, p_id int, PRIMARY KEY(e_id, p_id));"
        #print(query)
        cur.execute(query)
        
        spec = input("Doctor spec: ")
        query = "INSERT INTO TEMP\
            SELECT PRESCRIBE.e_id AS doctor, PRESCRIBE.p_id AS patient \
            FROM PRESCRIBE INNER JOIN DOCTOR_FUNC_1 ON PRESCRIBE.e_id = DOCTOR_FUNC_1.e_id \
            WHERE DOCTOR_FUNC_1.specialization = '%s' \
            GROUP BY doctor, patient" % spec
        
        #print(query)
        cur.execute(query)

        query = "SELECT * FROM TEMP"
        cur.execute(query)
        record = cur.fetchall()
        for row in record:
            print(row)

        medi = int(input("Medicine id: "))
        quan = int(input("Qunatity(input only in milli grams): "))

        query = "SELECT * FROM MEDICINE WHERE id = %d" % medi
        #print(query)
        cur.execute(query)
        record = cur.fetchone()
        var = record["quantity"]
        #print(var)
                
        query = "SELECT PRESCRIBE_FUNC_2.p_id AS p_id, SUM(PRESCRIBE_FUNC_2.medicine_count) AS count \
            FROM PRESCRIBE_FUNC_2 INNER JOIN TEMP ON PRESCRIBE_FUNC_2.p_id = TEMP.p_id \
            WHERE PRESCRIBE_FUNC_2.id = %d \
            GROUP BY p_id" % (medi)
        #print(query)
        cur.execute(query)
        record = cur.fetchall()

        res = 0
        for row in record:
            #print(row)
            ans = row["count"]
            if ans * var > quan:
                res += 1
        
        print(res)
            

        query = "DROP TEMPORARY TABLE IF EXISTS TEMP"
        #print(query)
        cur.execute(query)
        
            
        con.commit()
    except Exception as e:
        con.rollback()
        print("Failed to retrieve value from database")
        print(">", e)

    return


def option1():
    
    try:
        
        query = "SELECT * FROM PATIENT WHERE gender = 'M'"

        print(query)
        cur.execute(query)
        record = cur.fetchall()
        
        for row in record:
            print(row)
        
        con.commit()

        #print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to retrive from database")
        print(">", e)

    return


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        option1()
    elif(ch == 2):
        option2()
    elif(ch == 3):
        option3()
    elif(ch == 4):
        option4()
    elif(ch == 5):
        option5()
    elif(ch == 6):
        option6()
    elif(ch == 7):
        option7()
    elif(ch == 8):
        option8()
    elif(ch == 9):
        option9()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hard core username and password
    username = 'root'
    password = 'Re2van7tH'

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              user=username,
                              password=password,
                              db='HOSPITAL',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Option 1")  # Hire an Employee
                print("2. Option 2")  # Fire an Employee
                print("3. Option 3")  # Promote Employee
                print("4. Option 4")  # Employee Statistics
                print("5. Option 5")
                print("6. Option 6")
                print("7. Option 7")
                print("8. Option 8")
                print("9. Option 9")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 10:
                    break
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except:
        tmp = sp.call('clear', shell=True)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
