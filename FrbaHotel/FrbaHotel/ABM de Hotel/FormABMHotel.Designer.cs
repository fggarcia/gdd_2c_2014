namespace FrbaHotel.ABM_de_Hotel
{
    partial class FormABMHotel
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblName = new System.Windows.Forms.Label();
            this.textBoxName = new System.Windows.Forms.TextBox();
            this.lblStar = new System.Windows.Forms.Label();
            this.comboBoxStar = new System.Windows.Forms.ComboBox();
            this.lblCity = new System.Windows.Forms.Label();
            this.textBoxCity = new System.Windows.Forms.TextBox();
            this.lblCountry = new System.Windows.Forms.Label();
            this.textBoxCountry = new System.Windows.Forms.TextBox();
            this.buttonClean = new System.Windows.Forms.Button();
            this.buttonSearch = new System.Windows.Forms.Button();
            this.dgvHotel = new System.Windows.Forms.DataGridView();
            this.buttonBack = new System.Windows.Forms.Button();
            this.buttonCreate = new System.Windows.Forms.Button();
            this.buttonDisablePeriod = new System.Windows.Forms.Button();
            this.buttonDisable = new System.Windows.Forms.Button();
            this.buttonModify = new System.Windows.Forms.Button();
            this.buttonEnable = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvHotel)).BeginInit();
            this.SuspendLayout();
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Location = new System.Drawing.Point(118, 38);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(44, 13);
            this.lblName.TabIndex = 0;
            this.lblName.Text = "Nombre";
            // 
            // textBoxName
            // 
            this.textBoxName.Location = new System.Drawing.Point(189, 35);
            this.textBoxName.Name = "textBoxName";
            this.textBoxName.Size = new System.Drawing.Size(100, 20);
            this.textBoxName.TabIndex = 1;
            // 
            // lblStar
            // 
            this.lblStar.AutoSize = true;
            this.lblStar.Location = new System.Drawing.Point(641, 39);
            this.lblStar.Name = "lblStar";
            this.lblStar.Size = new System.Drawing.Size(46, 13);
            this.lblStar.TabIndex = 2;
            this.lblStar.Text = "Estrellas";
            // 
            // comboBoxStar
            // 
            this.comboBoxStar.FormattingEnabled = true;
            this.comboBoxStar.Location = new System.Drawing.Point(719, 36);
            this.comboBoxStar.Name = "comboBoxStar";
            this.comboBoxStar.Size = new System.Drawing.Size(121, 21);
            this.comboBoxStar.TabIndex = 2;
            // 
            // lblCity
            // 
            this.lblCity.AutoSize = true;
            this.lblCity.Location = new System.Drawing.Point(121, 69);
            this.lblCity.Name = "lblCity";
            this.lblCity.Size = new System.Drawing.Size(40, 13);
            this.lblCity.TabIndex = 4;
            this.lblCity.Text = "Ciudad";
            // 
            // textBoxCity
            // 
            this.textBoxCity.Location = new System.Drawing.Point(189, 69);
            this.textBoxCity.Name = "textBoxCity";
            this.textBoxCity.Size = new System.Drawing.Size(100, 20);
            this.textBoxCity.TabIndex = 3;
            // 
            // lblCountry
            // 
            this.lblCountry.AutoSize = true;
            this.lblCountry.Location = new System.Drawing.Point(644, 70);
            this.lblCountry.Name = "lblCountry";
            this.lblCountry.Size = new System.Drawing.Size(27, 13);
            this.lblCountry.TabIndex = 6;
            this.lblCountry.Text = "Pais";
            // 
            // textBoxCountry
            // 
            this.textBoxCountry.Location = new System.Drawing.Point(719, 69);
            this.textBoxCountry.Name = "textBoxCountry";
            this.textBoxCountry.Size = new System.Drawing.Size(100, 20);
            this.textBoxCountry.TabIndex = 4;
            // 
            // buttonClean
            // 
            this.buttonClean.Location = new System.Drawing.Point(189, 121);
            this.buttonClean.Name = "buttonClean";
            this.buttonClean.Size = new System.Drawing.Size(75, 23);
            this.buttonClean.TabIndex = 8;
            this.buttonClean.Text = "Limpiar";
            this.buttonClean.UseVisualStyleBackColor = true;
            this.buttonClean.Click += new System.EventHandler(this.buttonClean_Click);
            // 
            // buttonSearch
            // 
            this.buttonSearch.Location = new System.Drawing.Point(719, 121);
            this.buttonSearch.Name = "buttonSearch";
            this.buttonSearch.Size = new System.Drawing.Size(75, 23);
            this.buttonSearch.TabIndex = 9;
            this.buttonSearch.Text = "Buscar";
            this.buttonSearch.UseVisualStyleBackColor = true;
            this.buttonSearch.Click += new System.EventHandler(this.buttonSearch_Click);
            // 
            // dgvHotel
            // 
            this.dgvHotel.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvHotel.Location = new System.Drawing.Point(24, 182);
            this.dgvHotel.Name = "dgvHotel";
            this.dgvHotel.Size = new System.Drawing.Size(920, 150);
            this.dgvHotel.TabIndex = 10;
            // 
            // buttonBack
            // 
            this.buttonBack.Location = new System.Drawing.Point(57, 358);
            this.buttonBack.Name = "buttonBack";
            this.buttonBack.Size = new System.Drawing.Size(75, 23);
            this.buttonBack.TabIndex = 11;
            this.buttonBack.Text = "Volver";
            this.buttonBack.UseVisualStyleBackColor = true;
            this.buttonBack.Click += new System.EventHandler(this.buttonBack_Click);
            // 
            // buttonCreate
            // 
            this.buttonCreate.Location = new System.Drawing.Point(214, 357);
            this.buttonCreate.Name = "buttonCreate";
            this.buttonCreate.Size = new System.Drawing.Size(75, 23);
            this.buttonCreate.TabIndex = 12;
            this.buttonCreate.Text = "Crear";
            this.buttonCreate.UseVisualStyleBackColor = true;
            this.buttonCreate.Click += new System.EventHandler(this.buttonCreate_Click);
            // 
            // buttonDisablePeriod
            // 
            this.buttonDisablePeriod.Location = new System.Drawing.Point(388, 358);
            this.buttonDisablePeriod.Name = "buttonDisablePeriod";
            this.buttonDisablePeriod.Size = new System.Drawing.Size(75, 23);
            this.buttonDisablePeriod.TabIndex = 13;
            this.buttonDisablePeriod.Text = "Baja Periodo";
            this.buttonDisablePeriod.UseVisualStyleBackColor = true;
            this.buttonDisablePeriod.Click += new System.EventHandler(this.buttonDisablePeriod_Click);
            // 
            // buttonDisable
            // 
            this.buttonDisable.Location = new System.Drawing.Point(692, 358);
            this.buttonDisable.Name = "buttonDisable";
            this.buttonDisable.Size = new System.Drawing.Size(75, 23);
            this.buttonDisable.TabIndex = 14;
            this.buttonDisable.Text = "Deshabilitar";
            this.buttonDisable.UseVisualStyleBackColor = true;
            this.buttonDisable.Click += new System.EventHandler(this.buttonDisable_Click);
            // 
            // buttonModify
            // 
            this.buttonModify.Location = new System.Drawing.Point(833, 357);
            this.buttonModify.Name = "buttonModify";
            this.buttonModify.Size = new System.Drawing.Size(75, 23);
            this.buttonModify.TabIndex = 15;
            this.buttonModify.Text = "Modificar";
            this.buttonModify.UseVisualStyleBackColor = true;
            this.buttonModify.Click += new System.EventHandler(this.buttonModify_Click);
            // 
            // buttonEnable
            // 
            this.buttonEnable.Location = new System.Drawing.Point(542, 358);
            this.buttonEnable.Name = "buttonEnable";
            this.buttonEnable.Size = new System.Drawing.Size(75, 23);
            this.buttonEnable.TabIndex = 16;
            this.buttonEnable.Text = "Habilitar";
            this.buttonEnable.UseVisualStyleBackColor = true;
            this.buttonEnable.Click += new System.EventHandler(this.buttonEnable_Click);
            // 
            // FormABMHotel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(971, 424);
            this.Controls.Add(this.buttonEnable);
            this.Controls.Add(this.buttonModify);
            this.Controls.Add(this.buttonDisable);
            this.Controls.Add(this.buttonDisablePeriod);
            this.Controls.Add(this.buttonCreate);
            this.Controls.Add(this.buttonBack);
            this.Controls.Add(this.dgvHotel);
            this.Controls.Add(this.buttonSearch);
            this.Controls.Add(this.buttonClean);
            this.Controls.Add(this.textBoxCountry);
            this.Controls.Add(this.lblCountry);
            this.Controls.Add(this.textBoxCity);
            this.Controls.Add(this.lblCity);
            this.Controls.Add(this.comboBoxStar);
            this.Controls.Add(this.lblStar);
            this.Controls.Add(this.textBoxName);
            this.Controls.Add(this.lblName);
            this.Name = "FormABMHotel";
            this.Text = "FormABMHotel";
            this.Load += new System.EventHandler(this.FormABMHotel_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvHotel)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.TextBox textBoxName;
        private System.Windows.Forms.Label lblStar;
        private System.Windows.Forms.ComboBox comboBoxStar;
        private System.Windows.Forms.Label lblCity;
        private System.Windows.Forms.TextBox textBoxCity;
        private System.Windows.Forms.Label lblCountry;
        private System.Windows.Forms.TextBox textBoxCountry;
        private System.Windows.Forms.Button buttonClean;
        private System.Windows.Forms.Button buttonSearch;
        private System.Windows.Forms.DataGridView dgvHotel;
        private System.Windows.Forms.Button buttonBack;
        private System.Windows.Forms.Button buttonCreate;
        private System.Windows.Forms.Button buttonDisablePeriod;
        private System.Windows.Forms.Button buttonDisable;
        private System.Windows.Forms.Button buttonModify;
        private System.Windows.Forms.Button buttonEnable;
    }
}