from tkinter import *
import psycopg2
#postgresql-cubic-98264
root = Tk()
root.title('RTO - List vehicles with certain color and fuel type')
root.geometry("1000x1000")
#Confiure and connect to Postgres
def clear():
    color.delete(0, END)
    fuel.delete(0, END)

def submit():
    # Configure and connect to Postgres
    con = psycopg2.connect(
        host="localhost",
        database="rto1",
        user="postgres",
        password="503",

    )

    # Create a cursor
    c = con.cursor()

    # Insert data into table
    thing1 = color.get()
    thing2 = fuel.get()
    c.execute('''SELECT owner, veh_no from vehicle where veh_color='''+thing1 +''' and Fuel_type ='''+thing2+''';''')
    record = c.fetchall()
    global i 
    i=4
    for student in record:
        for j in (range(len(student))):
            e = Label(new_frame, width = 10, text = student[j])
            e.grid(row=i, column =j,pady=10, padx=10)
        i = i +1
    con.commit()
    con.close()

    #show()
    clear()



'''def show():
    # Configure and connect to Postgres
    conn = psycopg2.connect(
        conn = psycopg2.connect(
        host="localhost",
        database="rto1",
        user="postgres",
        password="503",
    )

    # Create a cursor
    c = conn.cursor()

    # Grab stuff from online database
    c.execute("SELECT * FROM customers")
    records = c.fetchall()

    output = ''

    # Loop thru the results
    for record in records:
        output_label.config(text=f'{output}\n{record[0]} {record[1]}')
        output = output_label['text']

    conn.close()'''


# Create The GUI For The App
my_frame = LabelFrame(root, text="Color and Fuel Type")
my_frame.pack(pady=20)

c_label = Label(my_frame, text="Veh Color:")
c_label.grid(row=0, column=0, pady=10, padx=10)

color = Entry(my_frame, font=("Helvetica, 18"))
color.grid(row=0, column=1, pady=10, padx=10)

f_label = Label(my_frame, text="Fuel Type:")
f_label.grid(row=1, column=0, pady=10, padx=10)

fuel = Entry(my_frame, font=("Helvetica, 18"))
fuel.grid(row=1, column=1, pady=10, padx=10)

submit_button = Button(my_frame, text="Submit", command=submit)
submit_button.grid(row=2, column=0, pady=10, padx=10)

new_frame = LabelFrame(root, text="New Frame")
new_frame.pack(pady=20)

'''name_label = Label (my_frame, text = 'Name')
name_label.grid(row=3, column=0, pady=10, padx=10)

Vehno_label = Label (my_frame, text = 'Vehicle number')
Vehno_label.grid(row=3, column=1, pady=10, padx=10)

for i in submit():
    j=4
    name_label1 = Label (my_frame, text = i[0])
    name_label1.grid(row=j, column=0, pady=10, padx=10)

    Vehno_label1 = Label (my_frame, text = i[1])
    Vehno_label1.grid(row=j, column=1, pady=10, padx=10)
    j = j +1'''

'''show_button = Button(my_frame, text="Update", command=show)
show_button.grid(row=2, column=1, pady=10, padx=10)'''

output_label = Label(root, text="")
output_label.pack(pady=50)


root.mainloop()