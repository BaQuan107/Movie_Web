//ammount create acount -linechart
function chartCreateAcc(){
  let targetE = document.getElementById('create-account')
  let fetchData = targetE.dataset.createacc
  let dataResult = fetchData.split(',')
  
  const labelsCreateAccount = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
  ];
  const dataCreateAccount = {
      labels: labelsCreateAccount,
      datasets: [{
          label: 'Account creating per month',
          backgroundColor: 'rgb(255, 99, 132)',
          borderColor: 'rgb(255, 99, 132)',
          data: dataResult,
      }]
  };
  const configCreateAccount = {
      type: 'line',
      data: dataCreateAccount,
      options: {
          plugins: {
              legend: {
                  labels: {
                      font: {
                          size: 16
                      }
                  }
              }
          }
      }
  };
  const ChartCA = new Chart(
      targetE,
      configCreateAccount
  );
}
chartCreateAcc()

//chart male/female - doughnutchart
function chartMaleFemale(){
  let targetE = document.getElementById('M__F-Account')
  let fetchData = targetE.dataset.mf
  let dataResult = fetchData.split(',')

  const dataMFAccount = {
      labels: [
        'Male',
        'Female'
      ],
      datasets: [{
        label: 'Male/Female ratio',
        data: dataResult,
        backgroundColor: [
          'rgb(54, 162, 235)',
          'rgb(255, 205, 86)'
        ],
        hoverOffset: 4
      }]
  };
  const configMFAccount = {
      type: 'doughnut',
      data: dataMFAccount,
  };
  const ChartMFAccount = new Chart(
      targetE,
      configMFAccount
  );
}
chartMaleFemale()

//genre movie - Pie Charts
function chartGenreMovie() {
  let targetE = document.getElementById('genre-movie')
  let fetchData = targetE.dataset.gm
  let dataResultAll = fetchData.split(',')
  let dataDataset = [], dataLabel = [], dataColor = []

  for(let dataTmp of dataResultAll) {
    dataLabel.push(dataTmp.split('-')[0])
    dataDataset.push(dataTmp.split('-')[1])
    dataColor.push(`#${Math.floor(Math.random()*16777215).toString(16)}`)
  }
  console.log(dataColor)

  const dataGM = {
      labels: dataLabel,
      datasets: [{
        label: 'My First Dataset',
        data: dataDataset,
        backgroundColor: dataColor,
        hoverOffset: 4
      }]
  };
  const configGM = {
      type: 'pie',
      data: dataGM,
  };
  const ChartGM = new Chart(
      targetE,
      configGM
  );
}
chartGenreMovie()

//movie has most view per week - barchart
function chartMovieViewer(){
  let targetE = document.getElementById('movie-viewer')
  let fetchData = targetE.dataset.mv
  let dataResultAll = fetchData.split(',')
  let dataDataset = [], dataLabel = []

  for(let dataTmp of dataResultAll) {
    dataLabel.push(dataTmp.split('_')[0])
    dataDataset.push(dataTmp.split('_')[1])
  }

  const labelsMV = ['1', '2', '3', '4', '5', '6', '7'];
  const dataMV = {
    labels: labelsMV,
    datasets: [{
      axis: 'y',
      label: 'Most viewer per month',
      data: dataDataset,
      fill: false,
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(255, 159, 64, 0.2)',
        'rgba(255, 205, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(201, 203, 207, 0.2)'
      ],
      borderColor: [
        'rgb(255, 99, 132)',
        'rgb(255, 159, 64)',
        'rgb(255, 205, 86)',
        'rgb(75, 192, 192)',
        'rgb(54, 162, 235)',
        'rgb(153, 102, 255)',
        'rgb(201, 203, 207)'
      ],
      borderWidth: 1
    }]
  };
  const configMV = {
      type: 'bar',
      data: dataMV,
      options: {
        indexAxis: 'y',
        plugins: {
          tooltip: {
            callbacks: {
              title: (arg)=>{
                return dataLabel[arg[0].label-1]
              },
            }
          }
        }
      }
  };
  const ChartMV = new Chart(
      document.getElementById('movie-viewer'),
      configMV
  );
}
chartMovieViewer()

//Statistic money each week - line chart
function chartStatisticMoney() {
  let targetE = document.getElementById('statistic-money')
  let fetchData = targetE.dataset.sm
  let dataResult = fetchData.split(',')


  const labelsSM = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
  ];
  const dataSM = {
    labels: labelsSM,
    datasets: [
      {
        label: 'monthly income',
        data: dataResult,
        borderColor: '#eeb03f',
        backgroundColor: '#eeb03f',
        stack: 'combined',
        type: 'bar'
      },
      {
        label: 'Line chart',
        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        borderColor: 'blue',
        backgroundColor: 'blue',
        stack: 'combined'
      }
    ]
  };
  const configSM = {
      type: 'line',
      data: dataSM,
      options: {
        scales: {
          y: {
            stacked: true
          }
        }
      },
    };
  const ChartSM = new Chart(
      targetE,
      configSM
  );
}
chartStatisticMoney()