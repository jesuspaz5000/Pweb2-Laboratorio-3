<?php
    namespace App\Controller;

    use App\Controller\AppController;

    class CompanyController extends AppController{
        public function index(){
            $this->Flash->success('Operacion exitosa');

            $Company = $this->Company->find('all');
            $this->set('Company', $Company);
        }
        public function edit(){
            $item = $this->Company->get(17);
            $new->Company_Name = 'Empresa4';
            $new->Company_Adress_Code = 12345;
            $new->Company_Transport_Number = 30;
            $new->Company_Mail = 'empresa4@gmail.com';
            $new->Company_Web_Site = 'empresa4.com';
            $new->Company_Registration_Status = 0;
            if($this->Company->save($item)){
                $this->Flash->success('La empresa a sido modificada con exito');
            }
            else{
                $this->Flash->error('No se pudo modificar la empresa');
            }
        }
        public function add(){
            $new = $this->Company->newEntity();
            $new->Company_Name = 'Empresa 3';
            $new->Company_Adress_Code = 12345;
            $new->Company_Transport_Number = 50;
            $new->Company_Mail = 'retamozo@gmail.com';
            $new->Company_Web_Site = 'retamozo.com';
            $new->Company_Registration_Status = 1;
            if($this->Company->save($new)){
                $this->Flash->success('La empresa a sido guardada con exito');
            }
            else{
                $this->Flash->error('No se pudo guardar la empresa');
            }
        }
        public function delete(){
            $entity = $this->Company->get(18);
            if($this->Company->delete($entity)){
                $this->Flash->success('La empresa a sido eliminada con exito');
            }
            else{
                $this->Flash->error('No se pudo eliminar la empresa');
            }
            
        }
    }