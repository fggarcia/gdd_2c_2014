using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FrbaHotel.Facturar_Publicaciones
{
    public partial class FormFacturarPublicacionesDetail : Form
    {
        private Int32 stayId;
        private Int32 clientId;
        private String name;
        private String lastName;
        private Boolean hasCard;

        public FormFacturarPublicacionesDetail(Int32 stayId, Int32 clientId, String name, String lastName)
        {
            InitializeComponent();
            this.ControlBox = false;
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Maximized;
            this.stayId = stayId;
            this.clientId = clientId;
            this.name = name;
            this.lastName = lastName;
            TypePay.fillComboBox(this.comboBoxTypePay);
            this.hasCard = false;
            this.loadCharge();
        }

        private void FormFacturarPublicacionesDetail_Load(object sender, EventArgs e)
        {
            this.textBoxClientId.Text = this.clientId.ToString();
            this.textBoxClientId.Enabled = false;

            this.textBoxName.Text = this.name;
            this.textBoxName.Enabled = false;

            this.textBoxLastName.Text = this.lastName;
            this.textBoxLastName.Enabled = false;

            this.textBoxStayId.Text = this.stayId.ToString();
            this.textBoxStayId.Enabled = false;

            this.textBoxCardNumber.Enabled = false;
            this.textBoxTotalCharge.Enabled = false;
        }

        private void loadCharge()
        {
            ChargeStayHelper.loadCharge(stayId, dgvChargeDetail);
            Double total = 0D;

            foreach (DataGridViewRow row in dgvChargeDetail.Rows)
            {
                Int32 count = Convert.ToInt32(row.Cells[1].Value);
                Double charge = Convert.ToDouble(row.Cells[2].Value);

                total += (count * charge);
            }

            textBoxTotalCharge.Text = total.ToString();
        }

        private void comboBoxTypePay_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.comboBoxTypePay.Text.ToUpper() != "TARJETA CREDITO")
            {    
                this.textBoxCardNumber.Enabled = false;
                this.hasCard = false;
            }
            else
            {
                this.textBoxCardNumber.Enabled = true;
                this.hasCard = true;
            }
        }

        private void buttonCharge_Click(object sender, EventArgs e)
        {
            if (comboBoxTypePay.Text != String.Empty)
            {
                String typePay = comboBoxTypePay.Text;
                Int32 numberCard;
                if (typePay.ToUpper() == "EFECTIVO")
                {
                    numberCard = 0;
                }
                else
                {
                    Boolean isValid = Validaciones.validAndRequiredInt32MoreThan0(textBoxCardNumber.Text,
                        "El numero de tarjeta de credito debe ser numerico y mayor a 0");
                    if (isValid)
                    {
                        numberCard = Convert.ToInt32(textBoxCardNumber.Text);
                    }
                    else
                    {
                        return;
                    }
                }
                ChargeStayHelper.charge(stayId, clientId,typePay, numberCard);
                MessageBox.Show("Se facturo correctamente la estadia: " + stayId, "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.closeWindow();
            }
            else
            {
                MessageBox.Show("Debe seleccionar un tipo de pago", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void closeWindow()
        {
            FormFacturarPublicaciones formFacturarPublicaciones = new FormFacturarPublicaciones();
            formFacturarPublicaciones.MdiParent = this.MdiParent;
            MdiParent.Size = formFacturarPublicaciones.Size;
            this.Close();
            formFacturarPublicaciones.Show();
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.closeWindow();
        }
    }
}
