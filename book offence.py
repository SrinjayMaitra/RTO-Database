from tkinter import *
import psycopg2
root = Tk()
root.title('RTO - Book a fine')
root.geometry("1900x2000")
#Confiure and connect to Postgres
def clear():
    notice.delete(0, END)
    veh.delete(0, END)
    of.delete(0, END)
    due.delete(0, END)
    amt.delete(0, END)

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
    thing1 = notice.get()
    thing2 = veh.get()
    thing3 = of.get()
    thing4 = due.get()
    thing5 = amt.get()
    c.execute('''insert into offence values ('''+thing1+''','''+thing3+''','''+thing4+''','''+thing5+''');''')
    c.execute('''insert into vehicle_has_offence values ('''+thing2+''','''+thing1+''');''')
    c.execute('''select veh_no,offence_type,challan_due_date,amount from vehicle,vehicle_has_offence,offence
                where notice_no = notice_no_veh and veh_no = veh_no_off''')
    record = c.fetchall()
    global i 
    i=8
    for r in record:
        for j in (range(len(r))):
            if j==1:
                e = Label(new_frame, width = 10, text = r[j],justify=LEFT, anchor="w")
                e.grid(row=i, column =j,pady=10, padx=15)
            else:
                e = Label(new_frame, width = 10, text = r[j],justify=LEFT, anchor="w")
                e.grid(row=i, column =j,pady=10, padx=15)
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
my_frame = LabelFrame(root, text="Violation details")
my_frame.pack(pady=20)

n_label = Label(my_frame, text="Notice number:")
n_label.grid(row=0, column=0, pady=10, padx=10)

notice = Entry(my_frame, font=("Helvetica, 18"))
notice.grid(row=0, column=1, pady=10, padx=10)

veh_label = Label(my_frame, text="Vehicle Number:")
veh_label.grid(row=1, column=0, pady=10, padx=10)

veh = Entry(my_frame, font=("Helvetica, 18"))
veh.grid(row=1, column=1, pady=10, padx=10)

of_label = Label(my_frame, text="Offence Type:")
of_label.grid(row=2, column=0, pady=10, padx=10)

of = Entry(my_frame, font=("Helvetica, 18"))
of.grid(row=2, column=1, pady=10, padx=10)

due_label = Label(my_frame, text="Due date:")
due_label.grid(row=3, column=0, pady=10, padx=10)

due = Entry(my_frame, font=("Helvetica, 18"))
due.grid(row=3, column=1, pady=10, padx=10)

amt_label = Label(my_frame, text="Fine Amount:")
amt_label.grid(row=4, column=0, pady=10, padx=10)

amt = Entry(my_frame, font=("Helvetica, 18"))
amt.grid(row=4, column=1, pady=10, padx=10)

submit_button = Button(my_frame, text="Submit", command=submit)
submit_button.grid(row=5, column=0, pady=10, padx=10)

new_frame = LabelFrame(root, text="Showing all Offences")
new_frame.pack(pady=20)

veh_label1 = Label(new_frame, text="Vehicle Number", font ='bold')
veh_label1.grid(row=7, column=0, pady=10, padx=5)


of_label1 = Label(new_frame, text="Offence Type", font='bold', justify=LEFT, anchor="w")
of_label1.grid(row=7, column=1, pady=10, padx=0)


due_label1 = Label(new_frame, text="Due date", font='bold')
due_label1.grid(row=7, column=2, pady=10, padx=100)


amt_label1 = Label(new_frame, text="Fine Amount", font='bold')
amt_label1.grid(row=7, column=3, pady=10, padx=10)


output_label = Label(root, text="")
output_label.pack(pady=50)


root.mainloop()