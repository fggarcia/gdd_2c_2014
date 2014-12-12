using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using FrbaHotel.Common;
using FrbaHotel.ABM_de_Cliente;
using FrbaHotel.Registrar_Estadia;
	

namespace FrbaHotel.ABM_de_Reserva
{
    public partial class FormAltaReserva : Form
    {
        public FormAltaReserva()
        {
            InitializeComponent();
        }

        private void FormAltaReserva_Load(object sender, EventArgs e)
        {
            this.ControlBox = false;
            cmbHotel.Text = "";
            this.WindowState = FormWindowState.Maximized;
            ReservaHelper.search_regimen(VarGlobal.usuario.hotel, dgvRegimen);
            ReservaHelper.search_tipo_hab(VarGlobal.usuario.hotel, dgvTipoHabitacion);
            if (VarGlobal.usuario.id == "guest")
                ReservaHelper.fillHotel(cmbHotel);
            else
                cmbHotel.Visible = false;
                lblHotel.Visible = false;
                
        }

        private void button_volver_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button_consultar_Click(object sender, EventArgs e)
        {
            if ((dTDesde.Value > DateTime.Now) && (dTHasta.Value > DateTime.Now))

            {
                if (cmbHotel.SelectedValue.ToString() != String.Empty)
                {
                    VarGlobal.usuario.hotel = Convert.ToInt32(cmbHotel.SelectedValue.ToString());
                    ReservaHelper.search_regimen(VarGlobal.usuario.hotel, dgvRegimen);
                    ReservaHelper.search_tipo_hab(VarGlobal.usuario.hotel, dgvTipoHabitacion);
                }   
                
                    Reserva reserva = this.getdataConsulta();
                    if (reserva != null)
                    {
                        int disponible = ReservaHelper.check_hotel_availability(reserva);
                        if (disponible == 1)

                            MessageBox.Show("Hay disponibilidad de Habitacion");


                        else
                            MessageBox.Show("No hay disponibilidad de Habitacion. Elija otro rango de fechas u otro tipo de habitacion");
                    }
                    else
                    {
                        return;
                    }
                    
                
            }
            else
            {
                MessageBox.Show("Verificar las fechas Desde y Hasta");
            }
                
        }

        private Reserva getdataConsulta()
        {
            if (cmbHotel.Text == "")
            {
                MessageBox.Show("Debe seleccionar un hotel");
                return null;
            }
            else
            {
                Reserva reserva = new Reserva();
                if (VarGlobal.usuario.id=="guest"){
                    reserva.id_hotel=Convert.ToInt32(cmbHotel.Text);
                    lblHotel.Visible = true;
                }
                else
                reserva.id_hotel = VarGlobal.usuario.hotel;
                reserva.clienteId = Convert.ToInt32(dgvClient.CurrentRow.Cells[0].Value);
                reserva.fecha_inicio = dTDesde.Value;
                reserva.fecha_fin = dTHasta.Value;
                reserva.tipo_habitacion = dgvTipoHabitacion.CurrentRow.Cells[0].Value.ToString();
                return reserva;
            }
        }

        private void buttonAddClient_Click(object sender, EventArgs e)
        {
            FormABMClientModify formABMClientModify = new FormABMClientModify(false, null, this);
            formABMClientModify.MdiParent = this.MdiParent;
            MdiParent.Size = formABMClientModify.Size;
            formABMClientModify.Show();
        }

        private void buttonSearch_Click(object sender, EventArgs e)
        {
            Cliente client = this.getDataFromForm();

            CheckClientHelper.search(client, dgvClient);
        }

        private Cliente getDataFromForm()
        {
            Cliente cliente = new Cliente();
            cliente.name = textBoxName.Text;
            cliente.lastname = textBoxLastName.Text;

            if (textBoxDocumentNumber.Text != String.Empty)
            {
                if (Validaciones.validInt32(textBoxDocumentNumber.Text, "El documento a buscar no es valido, se realiza la busqueda sin filtro"))
                    cliente.documentNumber = Convert.ToInt32(textBoxDocumentNumber.Text);
                else
                    cliente.documentNumber = 0;
            }
            else
            {
                cliente.documentNumber = 0;
            }

            return cliente;
        }

        private void buttonClean_Click(object sender, EventArgs e)
        {
            textBoxDocumentNumber.Text = "";
            textBoxName.Text = "";
            textBoxLastName.Text = "";
            DataGridViewHelper.clean(dgvClient);
        }

        private void cmbHotel_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        private void buttonReservar_Click(object sender, EventArgs e)
        {
            if (dgvClient.CurrentRow.Selected == false)
                MessageBox.Show("Debe seleccionar algun cliente ya registrado, o registrar uno nuevo");
            else
            {
                Reserva reserva = this.getdataConsulta();
                ReservaHelper.reservar(reserva);
            }

        }

        
    }
}
