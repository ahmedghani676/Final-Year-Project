import mysql.connector

def convertToBinaryData(filename):
    # Convert digital data to binary format
    with open(filename, 'rb') as file:
        binaryData = file.read()
    return binaryData


def insertBLOB(emp_id, photo1, photo2,photo3,photo4):
  
  
  try:
    connection = mysql.connector.connect(host='localhost',
                                             database='fyp_managementsystem',
                                             user='root',
                                             password='',port = 3306)
    

    cursor = connection.cursor()
    sql_insert_blob_query = """ INSERT INTO encodings
              (roll_Number, Encoding1, Encoding2,Encoding3,Encoding4) VALUES (%s,%s,%s,%s)"""

    empPicture1 = convertToBinaryData(photo1)
    empPicture2 = convertToBinaryData(photo2)
    empPicture3 = convertToBinaryData(photo3)
    empPicture4 = convertToBinaryData(photo4)
        # Convert data into tuple format
    insert_blob_tuple = (emp_id, empPicture1, empPicture2,empPicture3,empPicture4)
    result = cursor.execute(sql_insert_blob_query, insert_blob_tuple)
    connection.commit()
    print("Image and file inserted successfully as a BLOB into python_employee table", result)

  except mysql.connector.Error as error:
    print("Failed inserting BLOB data into MySQL table {}".format(error))

 
    
    

insertBLOB('1', '/tmp/train/p1.jpeg', '/tmp/train/p2.jpeg',
           '/tmp/train/p3.jpeg','/tmp/train/p4.jpeg')
