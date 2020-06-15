package control;

import java.util.ArrayList;

public class Persons {
    private static Persons persons = new Persons();

    private Persons() {
    }

    public ArrayList<Person> personArrayList = new ArrayList<Person>();

    public Person findPerson(String id, String pass){
        for(Person p : this.personArrayList){
            if(id.equals(p.getId())){
                if(pass.equals(p.getPass())){
                    return p;
                }
            }
        }
        return null;
    }

    public Person FPP(String post){
        for(Person p : this.personArrayList){
            if(post.equals(p.getPost())){
                System.out.println("FPP:"+p);
                return p;
            }
        }
        System.out.println("FPP:null");
        return null;
    }

    public Person FPI(String id){
        for(Person p : this.personArrayList){
            if(id.equals(p.getId())){
                System.out.println("FPI:"+p);
                return p;
            }
        }
        System.out.println("FPI:null");
        return null;
    }

    public static Persons getPersons(){
        return persons;
    }
}
